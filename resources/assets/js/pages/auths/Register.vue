<template>
  <div class="card text-center d-flex justify-content-center" style="height: 100vh">
    <div>
      <router-link :to="{ name: 'HomePage'}">
        <img src="/assets_app/images/logo/icon-logo-kreatora.png" alt="Kreatora Logo" style="width: 60px; height: auto;">
        <div class="auth-logo-title">KREATORA</div>
      </router-link>
      <div class="card-body">
        <div class="form-signin">
          <div class="auth-section-title">Daftar</div>
          <div class="d-flex justify-content-around mb-3 auth-tab">
            <div class="auth-tab-item auth-tab-item-active">Email</div>
            <div class="auth-tab-item">Nomor Ponsel</div>
          </div>
          <div class="form-group">
            <input type="text" v-model="register.name" class="form-control auth-input" placeholder="Nama" required>
          </div>
          <div class="form-group">
            <input type="email" v-model="register.email" class="form-control auth-input" placeholder="Email" required>
          </div>
          <div class="form-group" style="position: relative">
            <input :type="isPassword ? 'password':'text'" v-model="register.password" class="form-control auth-input" placeholder="Password" required @keyup.enter="doRegister">
            <i class="fa fa-eye auth-eye" v-if="isPassword" @click="isPassword = false"></i>
            <i class="fa fa-eye-slash auth-eye" v-else @click="isPassword = true"></i>
          </div>
          <p class="my-4">Sudah punya akun? <router-link :to="{ name: 'Login' }">Login</router-link></p>
          <button class="btn btn-lg btn-primary btn-block" type="button" @click="doRegister">Daftar</button>
        </div>
      </div>
    </div>
    <loading :active.sync="is_loading"
             :can-cancel="false"
             :is-full-page="true"
             color="#008FD7"
    ></loading>
  </div>
</template>

<script>
import Api from "../../apis";
import Cookie from "vue-cookie";
export default {
  data() {
    return {
      is_loading: false,
      isPassword: true,
      register: {
        name: '',
        email: '',
        password: ''
      }
    }
  },
  mounted() {
  },
  methods: {
    doRegister() {
      this.$set(this, 'is_loading', true)
      Api.auth.register(this.register).then((res)=>{
        Cookie.set('verification_email', res.data.data.email, { expires: '1h' });
        this.$set(this, 'is_loading', false)
        this.$toastr.s(res.data.message);
        this.$router.push({ name: 'Verification'});
        // this.clearForm();
      }).catch((err)=>{
        this.$set(this, 'is_loading', false)
        if (err && err.response.data && err.response.data.message) {
          let messages = Object.values(err.response.data.message)
          messages.forEach((item) => {
            this.$toastr.e(item);
          })
        }
      });
    },
    clearForm() {
      this.$set(this.register,'name','');
      this.$set(this.register,'email','');
      this.$set(this.register,'password','');
      this.$set(this.register,'confirm_password','');
    }
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
