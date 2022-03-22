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
              @on-change="handleOnChange"
              @on-complete="handleOnComplete"
            />
          </div>
          <p class="my-4">
            <a href="javascript:void(0)" @click="resendCode" :class="{'verification-resend-disable': is_countdown}">Kirim ulang kode ?</a>
            <countdown :time="60 * 1000" :transform="transformSlotProps" v-slot="{ minutes, seconds }" @end="is_countdown= false" v-if="is_countdown">
              {{ minutes }}:{{ seconds }}
            </countdown>
            <span v-else>01:00</span>
          </p>
          <button class="btn btn-lg btn-primary btn-block" :class="{'disabled verification-button-disabled': !code}" type="button" @click="doVerification">Verifikasi</button>
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
import OtpInput from "@bachdgvn/vue-otp-input";
import Vue from 'vue';
import VueCountdown from '@chenfengyuan/vue-countdown'

Vue.component(VueCountdown.name, VueCountdown)
export default {
  components: {
    'v-otp-input': OtpInput
  },
  data() {
    return {
      is_countdown: true,
      is_loading: false,
      code: '',
    }
  },
  mounted() {
  },
  methods: {
    handleOnChange(value) {
      this.$set(this, "code", value)
    },
    handleOnComplete(value) {
      this.$set(this, "code", value)
    },
    doVerification() {
      if (!this.code) return null;
      this.$set(this,'is_loading',true);
      Api.auth.email_verification({code: this.code}).then((res)=>{
        this.$set(this, 'is_loading', false)
        this.$toastr.s(res.data.message + '. Silahkan login kembali');
        this.$router.push({ name: 'Login'});
      }).catch((err)=>{
        this.$set(this, 'is_loading', false)
        if (err && err.response.data && err.response.data.message) {
          if (typeof err.response.data.message === 'object') {
            let messages = Object.values(err.response.data.message)
            messages.forEach((item) => {
              this.$toastr.e(item);
            })
          } else this.$toastr.e(err.response.data.message);
        }
      });
    },
    resendCode() {
      if (this.is_countdown) return null;
      this.$set(this,'is_loading',true);
      Api.auth.resend_code({email: this.verificationEmail}).then((res)=>{
        this.$set(this, 'is_loading', false)
        this.$set(this, 'is_countdown', true)
        this.$toastr.s(res.data.message);
      }).catch((err)=>{
        this.$set(this, 'is_loading', false)
        if (err && err.response.data && err.response.data.message) this.$toastr.e(err.response.data.message);
      });
    },
    transformSlotProps(props) {
      const formattedProps = {};
      Object.entries(props).forEach(([key, value]) => {
        formattedProps[key] = value < 10 ? `0${value}` : String(value);
      });
      return formattedProps;
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
.verification-resend-disable {
  cursor: not-allowed;
  color: #5C5C70;
}
.verification-resend-disable:hover {
  cursor: not-allowed;
  text-decoration: unset;
  color: #5C5C70;
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
.verification-button-disabled:hover {
  cursor: not-allowed;
}
</style>
