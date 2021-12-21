<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Tambah Kategori Tarif</h1>
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

                        <form enctype="multipart/form-data" role="form" @submit.prevent="store()">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="name-categories">Nama Kategori Tarif :</label>
                                    <input v-model="rate_category.name" class="form-control" id="name-categories" placeholder="Masukan Nama Kategori">
                                </div>
                            </div>

                            <div class="card-footer">
                              <button type="submit" class="btn btn-primary">
                                <i v-if="pending"  class="fa fa-refresh fa-spin"></i>Simpan
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
        data() {
            return {
                isInitial:true,
                pending:false,
                rate_category: {
                    company_id: JSON.parse(Cookie.get("companySelected")).id,
                    name: '',
                }
            }
        },
        methods:{
            store(){
                this.pending = true;
                Api.rate_category.store(this.rate_category).then(({data}) => {
                    this.$store.dispatch("success", data.message).then(() => {
                        this.$router.push("/rate-category")
                    });
                    this.pending = false;
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

