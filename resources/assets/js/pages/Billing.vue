<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Tagihan Pelanggan</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-12">
                        <div v-if="isSuccess" class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Berhasil!</strong> {{messages}}
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <button class="btn btn-success" v-on:click="showPrintBillingModal('printBillingModalId')"><i class="fa fa-print"></i>
                                    Cetak Tagihan
                                </button>
                            </div>
                            <div class="card-body">
                                <table id="example2" class="table table-responsive-sm table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>tanggal</th>
                                        <th>pelanggan</th>
                                        <th>golongan</th>
                                        <th>penggunaan</th>
                                        <th>tagihan total</th>
                                        <th>status</th>
                                        <th>Aksi</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(billing, index) in billings"  v-bind:key="billing.id">
                                            <td>{{ moment(billing.created_at).format('DD MMMM YYYY') }}</td>
                                            <td>{{ billing.customer }}</td>
                                            <td>{{ billing.rate }}</td>
                                            <td class="number">{{ billing.used }}</td>
                                            <td class="number">
                                                {{ "Rp "+billing.total_price.toLocaleString('id-ID') }}
                                            </td>
                                            <td>{{ billing.status || null }}</td>
                                            <!--                                        <td>{{ "Rp "+billings.price.toLocaleString('id-ID') }}</td>-->
                                            <td>
                                                <button v-on:click=detailBillingModal(billing) type="button" class="btn btn-outline-info">
                                                    <i class="fa fa-info"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <pagination v-bind:pagination="paginator"  @paginate="fetch()" ></pagination>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
        <print-billing-modal></print-billing-modal>
        <billing-detail-modal
                :data="data_modal"
                :show="show"
                @close-modal="closeModal"
        ></billing-detail-modal>
        <loading :active.sync="pending"
                 :can-cancel="false"
                 :is-full-page="true"
                 color="#007bff"
        ></loading>
    </div>
</template>

<script>
    import _ from 'lodash';
    import moment from 'moment';
    import toastr from 'toastr';
    import Api from '../apis';
    import BillingDetailModal from "./billings/BillingDetailModal";
    import PrintBillingModal from "./billings/PrintBillingModal";
    import Cookie from "vue-cookie";
    export default {
        name: "Billing",
        components: { BillingDetailModal, PrintBillingModal },
        data() {
            return {
                moment: moment,
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                companySelected: JSON.parse(Cookie.get("companySelected")),
                activeModal: 0,
                paginator: {
                    current_page: ''
                },
                measurements:{},
                billings: {},
                data_modal: {},
                show: false,
                pending:false
            };
        },
        created() {
            this.fetch();
        },
        methods: {
            fetch() {
                this.$set(this, 'pending', true);
                Api.measurement.index({
                    company_id: (this.companySelected && this.companySelected.id)||null,
                    with: 'user,customer.rate_category.price_settings',
                    appends: 'measurement_before',
                    page: this.paginator.current_page
                }).then(({data}) => {
                    const pagination = {
                        "total_count": data.meta.total,
                        "total_pages": data.meta.last_page,
                        "current_page": data.meta.current_page,
                        "limit": data.meta.per_page
                    };
                    this.$set(this,'paginator', pagination);
                    this.$set(this,'measurements',data.data);
                    this.pricesBreakdown();
                    this.$set(this, 'pending', false);
                }).catch((err) => {
                    toastr.options.progressBar = true;
                    toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                });
            },
            pricesBreakdown() {
                this.billings = _.map(this.measurements, (measurement, key)=> {
                    let used = measurement.value - (measurement.measurement_before ? measurement.measurement_before.value: 0);
                    let price_settings = measurement.customer.rate_category && measurement.customer.rate_category.price_settings;
                    let total_price = 0;
                    let temp_value = 0;
                    let prices = _.map(price_settings, (price_setting) => {
                        let temp_price = 0;
                        if (price_setting.type === "variabel" && parseInt(price_setting.value) !== 0) {
                            if (used >= parseInt(price_setting.value)) {
                                total_price += (parseInt(price_setting.value) * parseInt(price_setting.multiplier));
                                temp_price = parseInt(price_setting.value) * parseInt(price_setting.multiplier);
                                temp_value = parseInt(price_setting.value);
                            } else if (used < parseInt(price_setting.value)) {
                                total_price += (used * parseInt(price_setting.multiplier));
                                temp_price = used * parseInt(price_setting.multiplier);
                                temp_value = parseInt(price_setting.value);
                            }
                        } else if (price_setting.type === "variabel" && parseInt(price_setting.value) === 0) {
                            if (used > temp_value) {
                                total_price += ((used - temp_value) * parseInt(price_setting.multiplier));
                                temp_price = (used - temp_value) * parseInt(price_setting.multiplier);
                                temp_value = parseInt(price_setting.value);
                            }
                        } else if (price_setting.type === "konstan") {
                            total_price = parseInt(total_price) + parseInt(price_setting.multiplier);
                            temp_price = parseInt(price_setting.multiplier);
                        }

                        return {
                            price: temp_price,
                            price_sum: total_price,
                            name : price_setting.name,
                            high_limit: parseInt(price_setting.value),
                            multiplier: parseInt(price_setting.multiplier),
                            type: price_setting.type
                        } ;
                    });

                    return {
                        id: measurement.id,
                        member_id: measurement.customer.member_id,
                        created_at: measurement.created_at,
                        customer: measurement.customer.name,
                        address: measurement.customer.address,
                        rate: measurement.customer.rate_category && measurement.customer.rate_category.name,
                        status: measurement.status || null,
                        previous_measurement : measurement.measurement_before ? measurement.measurement_before.value: 0,
                        current_measurement: measurement.value,
                        used: used,
                        prices: prices,
                        total_price: total_price,
                    }
                })
            },
            detailBillingModal: function (data) {
                this.data_modal = data;
                this.show = true;
            },
            closeModal: function () {
                this.show = false;
            },
            showPrintBillingModal: (idModal)=>{
                $('#'+idModal).modal('show');
            },
            hidePrintBillingModal: (idModal)=>{
                $('#'+idModal).modal('hide');
            }
        },
        computed: {
            isSuccess(){
                return this.$store.getters.isSuccess;
            },
            messages(){
                return this.$store.getters.messages;
            },
        }
    }
</script>

<style scoped>
    .number {
        text-align: right;
    }

</style>
