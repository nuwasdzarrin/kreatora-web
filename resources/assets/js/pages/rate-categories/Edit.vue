<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Edit Kategori Tarif</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <form enctype="multipart/form-data" role="form" @submit.prevent="update()">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="rate-category-name">Nama Kategori Tarif : </label>
                                        <input class="form-control" v-model="rate_category.name"  id="rate-category-name">
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">
                                        <i v-if="pending"  class="fa fa-refresh fa-spin"></i>Update
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
    import Api from '../../apis';
    import Cookie from "vue-cookie";
    export default {
        name: "EditRateCategory",
        props: {
            id: {
                type: [Number, String],
                required: true,
            }
        },
        data() {
            return {
                isInitial:true,
                pending:false,
                rate_category: {
                    name: '',
                }
            };
        },
        created() {
            this.fetch();
        },
        methods:{
            fetch(){
                Api.rate_category.index({
                    keys: this.id,
                    company_id: JSON.parse(Cookie.get("companySelected")).id
                }).then(({data}) => {
                    this.$set(this.rate_category,'name',data.data[0].name);
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
            update(){
                this.pending = true;
                Api.rate_category.update(this.id,this.rate_category).then(({data}) => {
                    this.$store.dispatch("success", data.message).then(() => {
                        this.$router.push("/rate-category")
                    });
                    this.pending = false;
                }).catch((error) => {
                    if(error.response.status == 401){
                        alert("Token Expired");
                        this.$update.dispatch('logout').then(() => {
                            this.$router.push("/login");
                        });
                    }else{
                        alert("Terjadi Kesalahan pada server");
                    }
                    this.pending = false;
                });
            }
        },
        computed: {
            checkIsInitial() {
                return this.isInitial;
            },
        }
    }
</script>

<style scoped>

</style>
