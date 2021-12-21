<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Daftar Meteran Air</h1>
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
                                <div class="row justify-content-between">
                                    <div class="col-md-3">
                                        <router-link  :to="{ name: 'water-meter-create'}" class="btn btn-primary" > <span class="fa fa-plus"></span>
                                            Tambah Meteran
                                        </router-link>
                                    </div>
                                    <div class="col-md-7">
                                        <my-company-select></my-company-select>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="example2" class="table table-responsive-sm table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>tanggal</th>
                                        <th>pelanggan</th>
                                        <th>bulan lalu</th>
                                        <th>bulan ini</th>
                                        <th>penggunaan</th>
                                        <th>pencatat</th>
                                        <th>Aksi</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(measurement, index) in measurements"  v-bind:key="measurement.id" >
                                        <td>{{ moment(measurement.created_at).format('DD MMMM YYYY') }}</td>
                                        <td>{{ measurement.customer.name }}</td>
                                        <td class="number">{{ measurement.measurement_before ? measurement.measurement_before.value : 0 }}</td>
                                        <td class="number">{{ measurement.value }}</td>
                                        <td class="number">{{ measurement.value - (measurement.measurement_before ? measurement.measurement_before.value : 0) }}</td>
                                        <td>{{ measurement.user.name }}</td>
<!--                                        <td>{{ "Rp "+measurement.price.toLocaleString('id-ID') }}</td>-->
                                        <td>
                                            <router-link  :to="{ name: 'water-meter-edit', params: {id:measurement.id}}"  class="btn btn-outline-success">
                                                <i class="fa fa-edit"></i>
                                            </router-link>
                                            <button v-on:click="destroy(measurement.id,index)" type="button" class="btn btn-outline-danger">
                                                <i v-if="pending"  class="fa fa-refresh fa-spin"></i>
                                                <i v-if="!pending" class="fa fa-trash"></i>
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
        <loading :active.sync="pending"
                 :can-cancel="false"
                 :is-full-page="true"
                 color="#007bff"
        ></loading>
    </div>
</template>

<script>
    import Api from '../apis';
    import moment from 'moment';
    import Cookie from "vue-cookie";

    export default {
        name: "WaterMeter",
        data() {
            return {
                moment: moment,
                companySelected: JSON.parse(Cookie.get("companySelected")),
                paginator: {
                    current_page: ''
                },
                measurements:[],
                pending:false,
            };
        },
        mounted() {
            moment.locale('id');
            this.fetch();
            window.events.$on(`my-company-select:changed`, (e) => {
                if (e) {
                    this.$set(this,'companySelected',JSON.parse(Cookie.get("companySelected")));
                    this.fetch();
                }
            });
        },
        methods: {
            fetch() {
                this.$set(this, 'pending', true);
                Api.measurement.index({
                    company_id: (this.companySelected && this.companySelected.id)||null,
                    with: 'user,customer',
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
                    this.$set(this,'measurements', data.data);
                    this.$set(this, 'pending', false);
                }).catch((error) => {
                    if(error.response.status == 401){
                        alert("Token Expired");
                        this.$store.dispatch('logout').then(() => {
                            this.$router.push("/login");
                        });
                    }else{
                        alert("Terjadi Kesalahan pada server");
                    }
                });
            },
            destroy(id,index){
                if (confirm("Apakah Anda Yakin ?")) {
                    this.$set(this, 'pending', true);
                    Api.measurement.destroy(id).then(({data}) => {
                        this.$store.dispatch("success", data.message).then(() => {
                            this.$delete(this.measurements, index);
                        });
                        this.$set(this, 'pending', false);
                        this.fetch();
                    }).catch((error) => {
                        if(error.response.status == 401){
                            alert("Token Expired");
                            this.$store.dispatch('logout').then(() => {
                                this.$router.push("/login");
                            });
                        }else{
                            alert("Terjadi Kesalahan pada server");
                        }
                        this.pending = false;
                    });
                }
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
