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

                        <form enctype="multipart/form-data" role="form" @submit.prevent="store({name,address,job,phone,image})">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="customer-name">Nama Pelanggan : </label>
                                    <input class="form-control" v-model="name" id="customer-name" placeholder="Masukan Nama Pelanggan" required="">
                                </div>
                                <div class="form-group">
                                    <label for="address">Alamat :</label>
                                    <input v-model="address" class="form-control" id="address" placeholder="Masukan Alamat Pelanggan">
                                </div>
                                <div class="form-group">
                                    <label for="job">Pekerjaan : </label>
                                    <input class="form-control"v-model="job"  id="job" placeholder="Masukkan Pekerjaan Pelanggan" >
                                </div>
                                <div class="form-group">
                                    <label for="phone-number">Nomor Telepon :</label>
                                    <input v-model="phone" class="form-control" id="phone-number" placeholder="Masukan Nomor Telp/HP pelanggan">
                                </div>
                                <div v-if="!image" class="form-group">
                                    <label for="image">Upload Gambar : </label>
                                  <div class="dropbox">
                                    <input type="file" id="image"  @change="onFileChange"
                                      accept="image/*" class="input-file" required="">
                                      <p v-if="checkIsInitial">
                                        Drag your file(s) here to begin<br> or click to browse
                                      </p>
                                  </div>
                                </div>
                                <div v-else>
                                    <img :src="image" width="200" height="200" />
                                    <button type="button" @click="removeImage">Remove image</button>
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
        data() {
            return {
                isInitial:true,
                image: '',
                attachment:'',
                pending:false,
                name : "",
                address: '',
                job: '',
                phone: ''
            };
          },

        methods:{
            store(){
                this.pending = true;
                var formData = new FormData();
                formData.append("avatar",this.attachment);
                formData.append("name", this.name);
                formData.append("address", this.address);
                formData.append("job", this.job);
                formData.append("phone", this.phone);
                Api.user.store(formData).then(({data}) => {
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

            onFileChange(e) {
              var files = e.target.files || e.dataTransfer.files;
              if (!files.length)
                return;
              this.attachment=files[0];
              this.createImage(files[0]);
            },

            createImage(file) {
              var image = new Image();
              var reader = new FileReader();
              var vm = this;
              this.isInitial = false;
              reader.onload = (e) => {
                vm.image = e.target.result;
              };
              reader.readAsDataURL(file);
            },

            removeImage: function (e) {
              this.image = '';
              this.isInitial = true;
            }
        },

        computed: {
          checkIsInitial() {
            return this.isInitial;
          },
        }

    }
</script>

