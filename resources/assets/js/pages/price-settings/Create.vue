<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="m-0 text-dark">Tambah Pengaturan Harga Kategori {{category_name}}</h1>
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
                                        <label for="rate-category">Kategori Tarif : </label>
                                        <input v-model="category_name" class="form-control" id="rate-category" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="name-categories">Nama Pengaturan Harga :</label>
                                        <input v-model="price_setting.name" class="form-control" id="name-categories" placeholder="Ex: Tarif 10 M3 Pertama">
                                    </div>
                                    <div class="form-group">
                                        <label for="high-meter-rate">Batas Meter :</label>
                                        <input v-model="price_setting.value" class="form-control" id="high-meter-rate" placeholder="Ex: 10, jika tidak ada isi 0">
                                        <p style="color: grey">*jika tidak ada isi dengan 0, jika nilai tak hingga isi dengan 0</p>
                                    </div>
                                    <div class="form-group">
                                        <label for="price-per-meter">Harga per Meter :</label>
                                        <input v-model="price_setting.multiplier" class="form-control" id="price-per-meter" placeholder="Ex: 2000">
                                    </div>
                                    <div class="form-group">
                                        <label for="type">Jenis :</label>
                                        <my-vue-select
                                                id="type"
                                                :clear-selected="false"
                                                :default-options="options"
                                                :default-selected="{name:'variabel'}"
                                                :searchable="false"
                                                @result="handleTypeSelected"
                                        ></my-vue-select>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">
                                        <i v-if="pending"  class="fa fa-refresh fa-spin"></i>Submit
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
        props: {
            category_id: {
                type: [Number,String],
                required: true,
            },
            category_name: {
                type: String,
                default: '...'
            }
        },
        data() {
            return {
                isInitial:true,
                pending:false,
                company_id: JSON.parse(Cookie.get("companySelected")).id,
                options: [
                    {name: 'variabel'},
                    {name: 'konstan'}
                ],
                price_setting: {
                    rate_category_id: this.category_id,
                    name: '',
                    value: 0,
                    multiplier: 0,
                    type: 'variabel',
                }
            };
        },

        methods:{
            store(){
                this.pending = true;
                Api.price_setting.store(this.price_setting).then(({data}) => {
                    this.$store.dispatch("success", data.message).then(() => {
                        this.$router.push("/rate-category/"+ this.price_setting.rate_category_id +"/price-setting")
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
            },
            handleRateCategoryResult(value){
                this.$set(this.price_setting,'rate_category_id', value.id);
            },
            handleTypeSelected(value){
                this.$set(this.price_setting,'type',value.name);
            },
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

