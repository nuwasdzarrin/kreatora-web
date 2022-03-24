<template>
  <div class="card text-center d-flex justify-content-center" style="height: 100vh">
    <div>
      <router-link :to="{ name: 'HomePage'}">
        <img src="/assets_app/images/logo/icon-logo-kreatora.png" alt="Kreatora Logo" style="width: 60px; height: auto;">
        <div class="auth-logo-title">KREATORA</div>
      </router-link>
      <div class="card-body">
        <div class="form-signin">
          <div class="auth-section-title">Masuk</div>
          <div class="d-flex justify-content-around mb-3 auth-tab">
            <div class="auth-tab-item auth-tab-item-active">Email</div>
            <div class="auth-tab-item">Nomor Ponsel</div>
          </div>
          <div class="form-group">
            <input type="text" v-model="email" class="form-control auth-input" placeholder="Email" required>
          </div>
          <div class="form-group" style="position: relative">
            <input :type="isPassword ? 'password':'text'" v-model="password" class="form-control auth-input" placeholder="Password" required @keyup.enter="doLogin">
            <i class="fa fa-eye auth-eye" v-if="isPassword" @click="isPassword = false"></i>
            <i class="fa fa-eye-slash auth-eye" v-else @click="isPassword = true"></i>
          </div>
          <p class="my-4">Belum punya akun? <router-link :to="{ name: 'Register' }">Daftar</router-link></p>
          <button class="btn btn-lg btn-primary btn-block" type="button" @click="doLogin">Masuk</button>
          <p class="mt-5">Atau lebih cepat ...</p>
          <div class="d-flex justify-content-center">
            <div class="auth-social mr-2"><i class="fab fa-google text-danger" style="font-size: 22px;"></i></div>
            <div class="auth-social ml-2"><i class="fab fa-facebook-f" style="color: #0024D7; font-size: 22px;"></i></div>
          </div>
<!--          <button class="btn btn-outline-danger btn-block"><i class="fab fa-google"></i> MASUK DENGAN GOOGLE</button>-->
<!--          <button class="btn btn-outline-primary btn-block"><i class="fab fa-facebook"></i> MASUK DENGAN FACEBOOK</button>-->
        </div>
<!--        <div v-else class="form-signin">-->
<!--          <p>Nice! Sekarang silakan masukkan-->
<!--            password akun anda</p>-->
<!--          <div v-if="isError" class="alert alert-danger">-->
<!--            <strong>Error!</strong> {{messages}}-->
<!--          </div>-->
<!--          <div v-if="isRegisterAlert" class="alert alert-success">-->
<!--            <strong>Berhasil!</strong> {{registerMessage}}-->
<!--          </div>-->
<!--          <div class="form-group mb-5">-->
<!--            <input type="password" v-model="password" class="form-control" placeholder="Masukkan password anda" required @keyup.enter="login">-->
<!--          </div>-->
<!--          <button class="btn btn-lg btn-primary btn-block" type="button" :disabled="isPending" @click="login"><i v-if="isPending" class="fab fa-login fa-refresh fa-spin"></i>MASUK</button>-->
<!--        </div>-->
      </div>
    </div>
    <loading :active.sync="isPending"
             :can-cancel="false"
             :is-full-page="true"
             color="#008FD7"
    ></loading>
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
    async doLogin() {
      if (!this.email || !this.password) return;
      await this.$store.dispatch("login", {
        email: this.email,
        password: this.password
      }).then((res) => {
        if (res.status === 401)
          this.$toastr.e(res.data.message);
          if (res.data.redirect_to === 'verification') {
            Cookie.set('verification_email', this.email, { expires: '1h' });
            this.$router.push({ name: 'Verification'});
          }
        else {
          this.$toastr.s("login success");
          window.location.href = '/dashboard';
          // this.$router.push({ name: 'HomePage'});
        }
      });
    }
  },
  computed: {
    isPending(){
      return this.$store.getters.isPending;
    },
  }
}
</script>
<style lang="css" scoped>
.auth-logo-title {
  font-family: 'Arial Rounded MT Bold';
  font-weight: 700;
  font-size: 24px;
  color: #008FD7;
  margin-top: 20px;
}
.auth-section-title {
  font-family: 'Nunito Sans';
  font-style: normal;
  font-weight: 700;
  font-size: 20px;
  text-align: left;
  line-height: 140%;
  color: #7D7D8D;
  margin-bottom: 15px;
}
.auth-tab {
  background: #E6E6E6;
  padding: 8px 0;
  border-radius: 100px;
  color: black;
}
.auth-tab-item {
  width: 150px;
  padding: 4px 0;
  border-radius: 100px;
  cursor: pointer;
}
.auth-tab-item-active {
  background: #FFFFFF;
}
.auth-input {
  border: 2px solid #7D7D8D;
  box-sizing: border-box;
  border-radius: 12px;
}
.auth-eye {
  position: absolute;
  top: 15px;
  right: 15px;
  z-index: 2;
  cursor: pointer;
}
.auth-social {
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background-color: white;
  box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.15), -1px -1px 0 #F8F8F8;
  cursor: pointer;
}
</style>
