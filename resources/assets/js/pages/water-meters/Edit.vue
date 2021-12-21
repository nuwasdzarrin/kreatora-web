<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Edit Meteran</h1>
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
                                        <label for="customer">Pelanggan : </label>
                                        <input class="form-control" v-model="customer_name" id="customer" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="latest-measurement">Meteran bulan lalu :</label>
                                        <input type="number" v-model="value_before" class="form-control" id="latest-measurement" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="measurement">Meteran bulan ini : </label>
                                        <input class="form-control" v-model="measurement.value"  id="measurement">
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
        name: "Edit",
        props: {
            id: {
                type: [Number, String],
                required: true,
            },
        },
        data() {
            return {
                isInitial:true,
                image: '',
                attachment:'',
                pending:false,
                name : "",
                price : 0,
                description:"",
                customer_name: '',
                value_before: '',
                measurement: {
                    customer_id: '',
                    value: ''
                }
            };
        },
        created() {
            this.fetch();
        },
        methods:{
            fetch(){
                Api.measurement.index({
                    keys: this.id,
                    company_id: JSON.parse(Cookie.get("companySelected")).id,
                    with: 'customer',
                    appends: 'measurement_before'
                }).then(({data}) => {
                    this.customer_name=data.data[0].customer.name;
                    this.value_before=data.data[0].measurement_before ? data.data[0].measurement_before.value : 0;
                    this.measurement.value=data.data[0].value;
                    this.measurement.customer_id = data.data[0].customer.id;
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
                if (this.measurement.value < this.value_before) {
                    this.measurement.value = '';
                    this.pending = false;
                    return alert("Nilai meteran bulan ini harus lebih besar dari pada bulan lalu");
                }
                Api.measurement.update(this.id,this.measurement).then(({data}) => {
                    this.$store.dispatch("success", data.message).then(() => {
                        this.$router.push("/water-meter")
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
