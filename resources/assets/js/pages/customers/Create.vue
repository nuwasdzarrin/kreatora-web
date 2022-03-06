<template>
    <div>
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Tambah Pelanggan</h1>
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
                            <form enctype="multipart/form-data" role="form" @submit.prevent="store({name,address,job,phone})">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="member-id">ID Pelanggan : </label>
                                        <input class="form-control" v-model="member_id" id="member-id" placeholder="Masukan ID Pelanggan" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="customer-name">Nama Pelanggan : </label>
                                        <input class="form-control" v-model="name" id="customer-name" placeholder="Masukan Nama Pelanggan" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="customer-category">Kategori Pelanggan : </label>
                                        <my-vue-select
                                                id="customer-category"
                                                caption="Ketik kategori tarif pelanggan ..."
                                                url="/api/rate_categories"
                                                :params="'&company_id='+company_id"
                                                :searchable="true"
                                                @result="handleRateCategoryResult"
                                        ></my-vue-select>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Alamat :</label>
                                        <input v-model="address" class="form-control" id="address" placeholder="Masukan Alamat Pelanggan">
                                    </div>
                                    <div class="form-group">
                                        <label for="job">Pekerjaan : </label>
                                        <input class="form-control" v-model="job"  id="job" placeholder="Masukkan Pekerjaan Pelanggan" >
                                    </div>
                                    <div class="form-group">
                                        <label for="phone-number">Nomor Telepon :</label>
                                        <input v-model="phone" class="form-control" id="phone-number" placeholder="Masukan Nomor Telp/HP pelanggan">
                                    </div>
                                    <image-form label="Unggah Gambar : " @result="handleResultImage"></image-form>
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
        data() {
            return {
                isInitial:true,
                company_id: JSON.parse(Cookie.get("companySelected")).id,
                rate_category_id: '',
                attachment:null,
                pending:false,
                member_id: '',
                name : "",
                address: '',
                job: '',
                phone: '',
            };
        },
        methods:{
            store(){
                this.pending = true;
                var formData = new FormData();
                if(this.attachment!=null){
                    formData.append("avatar",this.attachment);
                }
                formData.append("company_id",this.company_id);
                formData.append("rate_category_id",this.rate_category_id);
                formData.append("member_id",this.member_id);
                formData.append("name", this.name);
                formData.append("address", this.address);
                formData.append("job", this.job);
                formData.append("phone", this.phone);
                Api.customer.store(formData).then(({data}) => {
                    this.$store.dispatch("success", data.message).then(() => {
                        this.$router.push("/customer")
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
            handleResultImage(e){
                this.$set(this,'attachment',e)
            },
            handleRateCategoryResult(e){
                this.$set(this,'rate_category_id',e.id);
            }
        },
        computed: {
          checkIsInitial() {
            return this.isInitial;
          },
        }
    }
</script>

