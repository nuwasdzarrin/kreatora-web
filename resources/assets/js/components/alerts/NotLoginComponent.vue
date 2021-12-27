<template>
<div class="row">
  <div class="col-9">
    <div class="not-login-title">Ups! Kamu belum login</div>
    <div>Login dan dapatkan kartu backer pertama mu! </div>
  </div>
  <div class="col-3 text-right">
    <button class="btn btn-primary" @click="onClickLogin">Login</button>
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
