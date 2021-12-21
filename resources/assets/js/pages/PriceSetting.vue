<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="m-0 text-dark">Daftar Pengaturan Harga Kategori {{rate_category_name}}</h1>
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
                                <router-link :to="{ name: 'price-setting-create', params: { category_id:rate_category_id, category_name: rate_category_name}}" class="btn btn-primary" > <span class="fa fa-plus"></span>
                                    Tambah Pengaturan Harga
                                </router-link>
                            </div>
                            <div class="card-body">
                                <table id="example2" class="table table-responsive-sm table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kategori Tarif</th>
                                        <th>Nama</th>
                                        <th>Nilai Batas</th>
                                        <th>Harga per Meter</th>
                                        <th>Tipe</th>
                                        <th>Aksi</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(price_setting, index) in price_settings"  v-bind:key="price_setting.id" >
                                        <td>{{ index+1 }}</td>
                                        <td>{{ price_setting.rate_category.name }}</td>
                                        <td>{{ price_setting.name }}</td>
                                        <td class="number">{{ price_setting.value }}</td>
                                        <td class="number">{{ price_setting.multiplier }}</td>
                                        <td>{{ price_setting.type }}</td>
                                        <td>
                                            <router-link :to="{ name: 'price-setting-edit', params: {id:price_setting.id, priceSetting:price_setting}}"  class="btn btn-outline-success">
                                                <i class="fa fa-edit"></i>
                                            </router-link>
                                            <button v-on:click="destroy(price_setting.id,index,price_setting.name,price_setting.rate_category.name)" type="button" class="btn btn-outline-danger">
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
    export default {
        name: "PriceSetting",
        props: {
            rate_category_id: {
                type: [Number,String],
                required: true,
            },
            rate_category_name: {
                type: String,
                default: '...'
            }
        },
        data() {
            return {
                paginator: {
                    current_page: ''
                },
                price_settings:[],
                pending:false,
            };
        },
        created() {
            this.fetch();
        },
        methods: {
            fetch() {
                this.$set(this,'pending',true);
                Api.price_setting.index({
                    rate_category_id: this.rate_category_id,
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
                    this.$set(this,'price_settings',data.data);
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

            destroy(id,index, name, category){
                if (confirm(`Apakah Anda Yakin Akan Menghapus ${name} dikategori ${category} ?`)) {
                    this.pending = true;
                    Api.price_setting.destroy(id).then(({data}) => {
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
    .number {
        text-align: right;
    }
</style>
