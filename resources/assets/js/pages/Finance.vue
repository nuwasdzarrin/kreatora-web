<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Daftar Catatan Keuangan</h1>
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
                                <router-link  :to="{ name: 'finance-create'}" class="btn btn-primary" > <span class="fa fa-plus"></span>
                                    Tambah Transaksi
                                </router-link>
                            </div>
                            <div class="card-body">
                                <table id="example2" class="table table-responsive-sm table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Tanggal Transaksi</th>
                                        <th>Catatan</th>
                                        <th>Debit</th>
                                        <th>Kredit</th>
                                        <th>Saldo</th>
                                        <th>Opsi</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(transaction, index) in transactions"  v-bind:key="transaction.id" >
                                        <td>{{ moment(transaction.transaction_at).format('D MMMM YYYY') }}</td>
                                        <td>{{ transaction.remark }}</td>
                                        <td>{{ (transaction.amount >= 0) ? ("Rp "+transaction.amount.toLocaleString('id-ID')) : null }}</td>
                                        <td>{{ (transaction.amount < 0) ? ("Rp "+transaction.amount.toLocaleString('id-ID')) : null }}</td>
                                        <td>{{ (transaction.balance) ? ("Rp "+parseInt(transaction.balance).toLocaleString('id-ID')) : null }}</td>
                                        <td>
                                            <router-link  :to="{ name: 'finance-edit', params: {id:transaction.id, originTransaction:transaction} }"  class="btn btn-outline-success">
                                                <i class="fa fa-edit"></i>
                                            </router-link>
                                            <button v-on:click="destroy(transaction.id,index,transaction.remark)" type="button" class="btn btn-outline-danger">
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
    import moment from 'moment';
    import Api from '../apis';
    import Cookie from "vue-cookie";
    export default {
        name: "Finance",
        data() {
            return {
                moment: moment,
                paginator: {
                    current_page: ''
                },
                transactions:[],
                pending:false
            };
        },
        mounted() {
            moment.locale('id');
            this.fetch();
        },
        methods: {
            fetch() {
                this.pending = true;
                Api.finance.index({
                    company_id: JSON.parse(Cookie.get("companySelected")).id,
                    appends: 'balance',
                    page : this.paginator.current_page
                }).then(({data}) => {
                    const pagination = {
                        "total_count": data.meta.total,
                        "total_pages": data.meta.last_page,
                        "current_page": data.meta.current_page,
                        "limit": data.meta.per_page
                    };
                    this.$set(this,'paginator', pagination);
                    this.$set(this,'transactions', data.data);
                    this.pending = false;
                }).catch((error) => {
                    if (error.response) {
                        if (error.response.status == 401) {
                            alert("Token Expired");
                            this.$store.dispatch('logout').then(() => {
                                this.$router.push("/login");
                            });
                        } else {
                            alert("Terjadi Kesalahan pada server");
                        }
                    }
                });
            },
            destroy(id,index,remark){
                if (confirm(`Apakah Anda Yakin ingin menghapus ${remark} ?`)) {
                    this.pending = true;
                    Api.finance.destroy(id).then(({data}) => {
                        this.$store.dispatch("success", data.message).then(() => {
                            this.$delete(this.products, index);
                        });
                        this.pending = false;
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
            }
        }
    }
</script>

<style scoped>

</style>
