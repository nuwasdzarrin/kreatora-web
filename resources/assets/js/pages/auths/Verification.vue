<template>
  <div class="card text-center d-flex justify-content-center" style="height: 100vh">
    <div>
      <div class="card-body">
        <div class="form-signin">
          <div class="auth-section-title">Masukkan Kode Autentikasi</div>
          <p style="margin: 2rem 0;">Kode autentikasi baru saja dikirimkan ke alamat email <b>dianahmad@gmail.com</b></p>
          <div class="d-flex justify-content-center">
            <input min="0" max="9" maxlength="1" pattern="[0-9]" type="tel" class="verification-input">
            <input min="0" max="9" maxlength="1" pattern="[0-9]" type="tel" class="verification-input">
            <input min="0" max="9" maxlength="1" pattern="[0-9]" type="tel" class="verification-input">
            <input min="0" max="9" maxlength="1" pattern="[0-9]" type="tel" class="verification-input">
          </div>
          <p class="my-4"><router-link :to="{ name: 'Login' }">Kirim ulang kode ?</router-link> 04:30</p>
          <button class="btn btn-lg btn-primary btn-block" type="button" @click="login"><i v-if="isPending" class="fas fa-sign-in-alt fa-refresh fa-spin"></i>Verifikasi</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Api from "../../apis";
import toastr from "toastr";
import Cookie from "vue-cookie";
export default {
  data() {
    return {
      isLogin: true,
      isRegisterProcess: false,
      isRegisterAlert: false,
      isPassword: true,
      registerMessage: "",
      register: {
        name: '',
        email: '',
        password: '',
        confirm_password:''
      }
    }
  },
  mounted() {
  },
  methods: {
    async login() {
      if (!this.email || !this.password) return;
      await this.$store.dispatch("login", {
        email: this.email,
        password: this.password
      }).then((res) => {
        if (res.status === 401)
          this.$toastr.e(res.data.message);
        else {
          this.$toastr.s("login success");
          this.$router.push({ name: 'HomePage'});
        }
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
<style lang="css" scoped>
.auth-section-title {
  font-family: 'Nunito Sans';
  font-style: normal;
  font-weight: 700;
  font-size: 24px;
  line-height: 120%;
  color: #23232E;
  margin-bottom: 15px;
}
.verification-input {
  width: 50px;
  height: 65px;
  border: 2px solid #5C5C70;
  border-radius: 10px;
  margin: 0 8px;

  text-align: center;
  font-family: 'Nunito Sans';
  font-style: normal;
  font-weight: 600;
  font-size: 24px;
  line-height: 140%;
  color: #000000;
}
</style>
