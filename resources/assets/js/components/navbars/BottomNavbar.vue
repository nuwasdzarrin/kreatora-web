<template>
<div class="bottom-navbar-wrapper">
  <div class="text-center">
    <img src="/assets_app/icons/home-icon.png">
    <div>BERANDA</div>
  </div>
  <div class="text-center">
    <img src="/assets_app/icons/chat-icon.png">
    <div>CHAT</div>
  </div>
  <div class="text-center">
    <img src="/assets_app/icons/creation-icon.png">
    <div>KREASI</div>
  </div>
  <div class="text-center">
    <img src="/assets_app/icons/account-icon.png">
    <div>AKUN</div>
  </div>
</div>
</template>

<script>
export default {
  name: "BottomNavbar"
}
</script>

<style scoped>
.bottom-navbar-wrapper {
  width: 480px;
  margin: 0 -15px;
  padding: 10px;
  display: flex;
  justify-content: space-around;
  position: fixed;
  bottom: 0;
  background-color: #FFFFFF;
  box-shadow: 0 -2px 2px rgba(0, 0, 0, 0.15);
}
</style>
