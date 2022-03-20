<template>
  <div class="card text-center d-flex justify-content-center" style="position: relative; height: 100vh">
    <router-link class="verification-back" :to="{ name: 'Register' }"><i class="fas fa-arrow-left verification-back-icon"></i></router-link>
    <div>
      <div class="card-body">
        <div class="form-signin">
          <div class="auth-section-title">Masukkan Kode Verifikasi</div>
          <p style="margin: 2rem 0;">Kode verifikasi baru saja dikirimkan ke alamat email <b>{{verificationEmail}}</b></p>
          <div class="d-flex justify-content-center">
            <v-otp-input
              ref="otpInput"
              input-classes="verification-input"
              separator=""
              :num-inputs="4"
              :should-auto-focus="true"
              :is-input-num="true"
              @on-complete="handleOnComplete"
            />
          </div>
          <p class="my-4"><a href="javascript:void(0)" @click="resendCode">Kirim ulang kode ?</a> 04:30</p>
          <button class="btn btn-lg btn-primary btn-block" type="button" @click="doVerification">Verifikasi</button>
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
import toastr from "toastr";
import Cookie from "vue-cookie";
export default {
  data() {
    return {
      is_loading: false,
      code: '',
    }
  },
  mounted() {
  },
  methods: {
    handleOnComplete(value) {
      this.$set(this, "code", value)
    },
    doVerification() {
      this.$set(this,'is_loading',true);
      Api.auth.email_verification({code: this.code}).then((res)=>{
        this.$set(this, 'is_loading', false)
        this.$toastr.s(res.data.message + '. Silahkan login kembali');
        this.$router.push({ name: 'Login'});
      }).catch((err)=>{
        this.$set(this, 'is_loading', false)
        if (err && err.response.data && err.response.data.message) this.$toastr.e(err.response.data.message);
      });
    },
    resendCode() {
      this.$set(this,'is_loading',true);
      Api.auth.resend_code({email: this.verificationEmail}).then((res)=>{
        this.$set(this, 'is_loading', false)
        this.$toastr.s(res.data.message);
      }).catch((err)=>{
        this.$set(this, 'is_loading', false)
        if (err && err.response.data && err.response.data.message) this.$toastr.e(err.response.data.message);
      });
    },
  },
  computed: {
    verificationEmail() {
      return Cookie.get('verification_email')
    }
  }
}
</script>

<style lang="css">
.verification-back {
  position: absolute;
  top: 20px;
  left: 25px;
}
.verification-back-icon {
  font-size: 22px;
  color: #008FD7;
}
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
