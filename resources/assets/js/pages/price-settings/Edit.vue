<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="m-0 text-dark">Edit Pengaturan Harga Kategori {{rate_category_name}}</h1>
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
                                        <label for="company-name">Kategori Tarif : </label>
                                        <input class="form-control" v-model="rate_category_name" id="company-name" disabled>
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
                                        <label for="price-per-meter">Harga :</label>
                                        <input v-model="price_setting.multiplier" class="form-control" id="price-per-meter" placeholder="Ex: 2000">
                                    </div>
                                    <div class="form-group">
                                        <label for="type">Jenis :</label>
                                        <my-vue-select
                                                id="type"
                                                :clear-selected="false"
                                                :default-options="options"
                                                :default-selected="{name:price_setting.type}"
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
        name: "EditPriceSetting",
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
                rate_category_name: '',
                price_setting: {
                    rate_category_id: '',
                    name: '',
                    value: '',
                    multiplier: '',
                    type: '',
                },
                options: [
                    {name: 'variabel'},
                    {name: 'konstan'}
                ]
            };
        },
        created() {
            this.fetch();
        },
        methods:{
            handleTypeSelected(value){
                this.$set(this.price_setting,'type',value.name);
            },
            fetch(){
                Api.price_setting.index({
                    keys: this.id,
                    company_id: JSON.parse(Cookie.get("companySelected")).id,
                    with: 'rate_category'
                }).then(({data}) => {
                    this.$set(this,'rate_category_name',data.data[0].rate_category.name);
                    this.$set(this.price_setting,'rate_category_id',data.data[0].rate_category_id);
                    this.$set(this.price_setting,'name',data.data[0].name);
                    this.$set(this.price_setting,'value',data.data[0].value);
                    this.$set(this.price_setting,'multiplier',data.data[0].multiplier);
                    this.$set(this.price_setting,'type',data.data[0].type);
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
                Api.price_setting.update(this.id,this.price_setting).then(({data}) => {
                    this.$store.dispatch("success", data.message).then(() => {
                        this.$router.push("/price-setting")
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
