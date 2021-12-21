<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Daftar Pelanggan</h1>
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
                                <router-link  :to="{ name: 'customer-create'}" class="btn btn-primary" > <span class="fa fa-plus"></span>
                                    Tambah Pelanggan
                                </router-link>
                            </div>
                            <div class="card-body">
                                <table id="example2" class="table table-responsive-sm table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID Pel</th>
                                        <th>Foto</th>
                                        <th>Nama</th>
                                        <th>Alamat</th>
                                        <th>Pekerjaan</th>
                                        <th>No Telp</th>
                                        <th>Kategori Tarif</th>
                                        <th>Status</th>
                                        <th>Aksi</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(customer, index) in customers"  v-bind:key="customer.id" >
<!--                                        <td>{{ (paginator.limit*(paginator.current_page-1))+(index+1) }}</td>-->
                                        <td>{{ customer.member_id || '-' }}</td>
                                        <td>
                                            <img :src="customer.avatar?customer.avatar:'/images/default-avatar.png'" :alt="customer.name+'-avatar'" class="avatar">
                                        </td>
                                        <td>{{ customer.name || '-' }}</td>
                                        <td>{{ customer.address || '-' }}</td>
                                        <td>{{ customer.job || '-' }}</td>
                                        <td>{{ customer.phone || '-' }}</td>
                                        <td>{{ (customer.rate_category && customer.rate_category.name) || '-' }}</td>
                                        <td>{{ customer.status || '-' }}</td>
                                        <td>
                                            <router-link  :to="{ name: 'customer-edit', params: {id:customer.id}}"  class="btn btn-outline-success">
                                                <i class="fa fa-edit"></i>
                                            </router-link>
                                            <button v-on:click="destroy(customer.id,index,customer.name)" type="button" class="btn btn-outline-danger">
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
    import Cookie from "vue-cookie";
    export default {
        name: "Customer",
        data() {
            return {
                paginator: {
                    current_page: ''
                },
                customers:[],
                pending:false
            };
        },
        created() {
            this.fetch();
        },
        methods: {
            fetch() {
                this.$set(this,'pending',true);
                Api.customer.index({
                    company_id: JSON.parse(Cookie.get("companySelected")).id,
                    with: 'rate_category',
                    page: this.paginator.current_page
                }).then(({data}) => {
                    const pagination = {
                        "total_count": data.meta.total,
                        "total_pages": data.meta.last_page,
                        "current_page": data.meta.current_page,
                        "limit": data.meta.per_page
                    };
                    this.$set(this,'paginator',pagination);
                    this.$set(this,'customers',data.data);
                    this.$set(this,'pending',false);
                }).catch((error) => {
                    if(error.response.status == 401){
                        alert("Token Expired");
                        this.$store.dispatch('logout').then(() => {
                            this.$router.push("/login");
                        });
                    }else{
                        alert("Terjadi Kesalahan pada server");
                    }
                    this.$set(this,'pending',false);
                });
            },
            destroy(id,index,name){
                if (confirm(`Apakah Anda Yakin Akan Menghapus ${name} ?`)) {
                    this.pending = true;
                    Api.customer.destroy(id).then(({data}) => {
                        this.$store.dispatch("success", data.message).then(() => {
                            this.$delete(this.products, index);
                        });
                        this.pending = false;
                        this.fetch();
                    })
                    .catch((error) => {
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
    .avatar {
        vertical-align: middle;
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

</style>
