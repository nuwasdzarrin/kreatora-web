<template>
<div class="bottom-navbar-wrapper">
  <router-link :to="{ name: isLoggedIn ? 'DashboardHomePage' : 'HomePage'}" class="text-center list-navbar-menu">
    <img src="/assets_app/icons/home-icon.png">
    <div>BERANDA</div>
  </router-link>
  <div class="text-center">
    <img src="/assets_app/icons/chat-icon.png">
    <div>CHAT</div>
  </div>
  <div class="text-center">
    <img src="/assets_app/icons/creation-icon.png">
    <div>KREASI</div>
  </div>
  <router-link :to="{ name: 'DashboardAccount'}" class="text-center list-navbar-menu">
    <img src="/assets_app/icons/account-icon.png">
    <div>AKUN</div>
  </router-link>
</div>
</template>

<script>
export default {
  name: "BottomNavbar",
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    }
  }
}
</script>

<style scoped>
.bottom-navbar-wrapper {
  width: 100%;
  max-width: 480px;
  margin: 0 -15px;
  padding: 10px;
  display: flex;
  justify-content: space-around;
  position: fixed;
  bottom: 0;
  background-color: #FFFFFF;
  box-shadow: 0 -2px 2px rgba(0, 0, 0, 0.15);
}
.list-navbar-menu {
  color: #5C5C70;
}
</style>
