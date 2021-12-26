<template>
  <div class="sign-in-body text-center">
      <div class="card" style="min-height: 600px;">
        <div style="margin-top: 4rem;">
          <img src="/assets_app/images/logo/logo-blue.png" alt="Kreatora Logo" style="width: 130px; height: 40px;">
        </div>
          <div class="card-body">
              <div v-if="isStep1" class="form-signin">
                <p>Mari mendukung Kreasi terbaik anak bangsa</p>
                <div v-if="isError" class="alert alert-danger">
                    <strong>Danger!</strong> {{messages}}
                </div>
                <div v-if="isRegisterAlert" class="alert alert-success">
                    <strong>Berhasil!</strong> {{registerMessage}}
                </div>
                <div class="form-group">
                    <input type="text" v-model="email" class="form-control" placeholder="Masukkan email / no. ponsel anda" required>
                </div>
                <p style="font-size: 12px;">Belum punya akun? <a href="#">Daftar</a></p>
                <button class="btn btn-lg btn-primary btn-block" type="button" @click="isStep1=false"><i v-if="isPending" class="fas fa-sign-in-alt fa-refresh fa-spin"></i>LANJUTKAN</button>
                <p style="margin-top:50px;">Atau lebih cepat ...</p>
                <button class="btn btn-outline-danger btn-block"><i class="fab fa-google"></i> MASUK DENGAN GOOGLE</button>
                <button class="btn btn-outline-primary btn-block"><i class="fab fa-facebook"></i> MASUK DENGAN FACEBOOK</button>
              </div>
            <div v-else class="form-signin">
                <p>Nice! Sekarang silakan masukkan
                  password email <strong>{{email}}</strong></p>
                <div class="form-group mb-5">
                    <input type="password" v-model="password" class="form-control" placeholder="Masukkan email / no. ponsel anda" required>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="button" :disabled="isPending" @click="login"><i v-if="isPending" class="fab fa-login fa-refresh fa-spin"></i>MASUK</button>
              </div>
          </div>
      </div>
  </div>
</template>

<script>
import Api from "../apis";
import toastr from "toastr";
import Cookie from "vue-cookie";
export default {
    data() {
        return {
          isStep1: true,
            isLogin: true,
            isRegisterProcess: false,
            isRegisterAlert: false,
            email: "",
            password: "",
            registerMessage: "",
            register: {
                name: '',
                email: '',
                password: '',
                confirm_password:''
            }
        }
    },
    methods: {
        login() {
          this.$store.dispatch("login", {
            email: this.email,
            password: this.password
          }).then((res) => {
            console.log(res);
            this.$router.push({ name: 'HomePage'});
          });
        },
        doRegister() {
            this.$set(this,'isRegisterProcess',true);
            Api.auth.register(this.register).then((res)=>{
                this.$set(this,'isLogin',true);
                this.$set(this,'isRegisterAlert',true);
                this.$set(this,'registerMessage',res.data.message);
                this.$set(this,'isRegisterProcess',false);
                this.clearForm();
            }).catch((err)=>{
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                this.$set(this,'isRegisterProcess',false);
            });
        },
        clearForm() {
            this.$set(this.register,'name','');
            this.$set(this.register,'email','');
            this.$set(this.register,'password','');
            this.$set(this.register,'confirm_password','');
        }
    },
    computed: {
        isPending(){
          return this.$store.getters.isPending;
        },
        isError(){
          return this.$store.getters.isError;
        },
        messages(){
          return this.$store.getters.messages;
        },
      authUser(){
          return this.$store.getters.authUser;
        },
    }
}
</script>
