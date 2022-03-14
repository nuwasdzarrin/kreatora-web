<template>
  <div class="card text-center d-flex justify-content-center" style="height: 100vh">
    <div>
      <router-link :to="{ name: 'HomePage'}">
        <img src="/assets_app/images/logo/logo-blue.png" alt="Kreatora Logo" style="width: 130px; height: 40px;">
      </router-link>
      <div class="card-body">
        <div class="form-signin">
          <h5 class="my-4"><b>Buat Akun Baru</b></h5>
          <div class="form-group mb-3 text-left">
            <label class="mb-1">Nama Lengkap</label>
            <input type="text" v-model="password" class="form-control" placeholder="Masukkan nama anda" required>
          </div>
          <div class="form-group mb-3 text-left">
            <label class="mb-1">Email</label>
            <input type="email" v-model="password" class="form-control" placeholder="Masukkan email anda" required>
          </div>
          <div class="form-group mb-3 text-left">
            <label class="mb-1">Password</label>
            <input type="password" v-model="password" class="form-control" placeholder="Masukkan password anda" required @keyup.enter="login">
          </div>
          <p>Sudah punya akun? <router-link :to="{ name: 'Login' }">Login</router-link></p>
          <button class="btn btn-lg btn-primary btn-block" type="button" :disabled="isPending" @click="login"><i v-if="isPending" class="fab fa-login fa-refresh fa-spin"></i>REGISTER</button>
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
  .auth-input {
    border-radius: 12px;
  }
  .input-active {
    border: 2px solid #008FD7;
  }
</style>
