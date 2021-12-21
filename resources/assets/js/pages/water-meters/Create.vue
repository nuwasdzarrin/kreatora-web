<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Tambah Meteran</h1>
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
                                        <label for="customer">Pelanggan : </label>
                                        <my-vue-select
                                                id="customer"
                                                url="/api/customers"
                                                params="&with=latest_measurement"
                                                caption="Ketik nama pelanggan anda..."
                                                :show-address="true"
                                                @result="customerResult"
                                        >
                                        </my-vue-select>
                                    </div>
                                    <div class="form-group">
                                        <label for="latest-measurement">Meteran bulan lalu :</label>
                                        <input type="number" v-model="value_before" class="form-control" id="latest-measurement" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="measurement-value">Meteran bulan ini : </label>
                                        <input class="form-control" v-model="measurement.value"  id="measurement-value" placeholder="Meteran bulan ini" >
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
    import _ from 'lodash';
    import Api from '../../apis';
    import Cookie from "vue-cookie";
    export default {
        name: "Create",
        data() {
            return {
                isInitial:true,
                pending:false,
                value_before: '',
                measurement: {
                    company_id: JSON.parse(Cookie.get("companySelected")).id,
                    customer_id: '',
                    value: ''
                }
            };
        },
        methods:{
            store(){
                this.pending = true;
                if (this.measurement.value < this.value_before) {
                    this.measurement.value = '';
                    this.pending = false;
                    return alert("Nilai meteran bulan ini harus lebih besar dari pada bulan lalu");
                }
                Api.measurement.store(this.measurement).then(({data}) => {
                    this.$store.dispatch("success", data.message).then(() => {
                        this.$router.push("/water-meter")
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
            customerResult(event) {
                this.$set(this.measurement,'customer_id',event.id);
                this.$set(this.measurement,'value','');
                this.$set(this,'value_before',event.latest_measurement ? event.latest_measurement.value:0);
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
