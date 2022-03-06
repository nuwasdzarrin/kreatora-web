<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Daftar Kategori Tarif</h1>
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
                                <router-link  :to="{ name: 'rate-category-create'}" class="btn btn-primary" > <span class="fa fa-plus"></span>
                                    Tambah Kategori
                                </router-link>
                            </div>
                            <div class="card-body">
                                <table id="example2" class="table table-responsive-sm table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kategori Tarif</th>
                                        <th>Aksi</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(rate_category, index) in rate_categories"  v-bind:key="rate_category.id" >
                                        <td>{{ index+1 }}</td>
                                        <td>{{ rate_category.name }}</td>
                                        <td>
                                            <router-link :to="{ name: 'price-setting', params: { rate_category_id:rate_category.id, rate_category_name: rate_category.name}}"  class="btn btn-outline-primary" title="detail">
                                                <i class="fa fa-list-alt"></i>
                                            </router-link>
                                            <router-link  :to="{ name: 'rate-category-edit', params: { id:rate_category.id }}"  class="btn btn-outline-success" title="edit">
                                                <i class="fa fa-edit"></i>
                                            </router-link>
                                            <button v-on:click="destroy(rate_category.id,index,rate_category.name)" type="button" class="btn btn-outline-danger" title="hapus">
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
        name: "RateCategory",
        data() {
            return {
                paginator: {
                    current_page: ''
                },
                rate_categories:[],
                pending:false,
            };
        },
        created() {
            this.fetch();
        },
        methods: {
            fetch() {
                this.$set(this,'pending',true);
                Api.rate_category.index({
                    company_id: JSON.parse(Cookie.get("companySelected")).id,
                    page: this.paginator.current_page
                }).then(({data}) => {
                    let pagination = {
                        "total_count": data.meta.total,
                        "total_pages": data.meta.last_page,
                        "current_page": data.meta.current_page,
                        "limit": data.meta.per_page
                    };
                    this.$set(this,'paginator',pagination);
                    this.$set(this,'rate_categories',data.data);
                    this.$set(this,'pending',false);
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
                });
            },

            destroy(id,index,name){
                if (confirm(`Apakah Anda Yakin Akan Menghapus ${name} ?`)) {
                    this.pending = true;
                    Api.rate_category.destroy(id).then(({data}) => {
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
            },
        }
    }
</script>

<style scoped>

</style>
