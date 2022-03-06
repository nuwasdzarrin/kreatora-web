<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Tambah Transaksi</h1>
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
                                        <label for="transaction_at">Tanggal Transaksi :</label>
                                        <my-date-picker id="transaction_at" placeholder="Pilih tanggal transaksi" :result-props.sync="transaction.transaction_at"></my-date-picker>
                                    </div>
                                    <div class="form-group">
                                        <label for="remark">Catatan :</label>
                                        <input v-model="transaction.remark" class="form-control" id="remark" placeholder="Masukan catatan transaksi">
                                    </div>
                                    <div class="form-group">
                                        <label for="amount">Jumlah :</label>
                                        <input v-model="amount" type="number" class="form-control" id="amount" placeholder="Jumlah transaksi, isi dengan nilai >0 (positif)">
                                    </div>
                                    <div class="form-group">
                                        <label for="type">Type :</label>
                                        <my-vue-select
                                                id="type"
                                                :clear-selected="false"
                                                :default-options="options"
                                                :default-selected="{name:'Credit'}"
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
    export default {
        name: "Create",
        data() {
            return {
                isInitial:true,
                pending:false,
                options: [
                    {name: 'Credit'},
                    {name: 'Debit'}
                ],
                amount: '',
                type: null,
                transaction: {
                    company_id: JSON.parse(localStorage.getItem("companySelected")).id,
                    transaction_at: '',
                    remark: '',
                    amount: '',
                    type: 'Credit'
                }
            };
        },
        methods:{
            store(){
                this.pending = true;
                if (this.transaction.type=='Debit') this.$set(this.transaction, 'amount', this.amount);
                if (this.transaction.type=='Credit') this.$set(this.transaction, 'amount', -this.amount);

                Api.finance.store(this.transaction).then(({data}) => {
                    this.$store.dispatch("success", data.message).then(() => {
                        this.$router.push("/finance")
                    });
                    this.pending = false;
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
            },
            handleTypeSelected(value){
                this.$set(this.transaction,'type',value.name);
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
