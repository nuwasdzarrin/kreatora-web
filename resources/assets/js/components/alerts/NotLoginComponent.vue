<template>
<div class="d-flex justify-content-between">
  <div>
    <div class="not-login-title">Ups! Kamu belum masuk</div>
    <div>Login dan dapatkan kartu backer pertamamu! </div>
  </div>
  <div class="d-flex align-items-center">
    <button class="btn btn-primary" @click="onClickLogin">MASUK</button>
  </div>
</div>
</template>

<script>
export default {
  name: "NotLoginComponent",
  methods: {
    onClickLogin() {
      return this.$router.push({name: 'Login'});
    }
  }
}
</script>

<style scoped>
.not-login-title {
  font-weight: 600;
  font-size: 14px;
  line-height: 140%;
  color: #000000;
}
</style>
