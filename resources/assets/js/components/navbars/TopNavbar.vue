<template>
  <nav class="navbar navbar-expand navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav left-nav">
      <li class="nav-item d-flex align-items-center">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
      <li class="nav-item d-flex ml-3">
        <input type="text" class="input-search" placeholder='Coba cari "ide hebat"'>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <!--   <notification-list />-->
      <li class="nav-item">
        <a href="#" class="nav-link text-danger" v-if="isLoggedIn" @click="logout">
          <i class="fas fa-bell" style="font-size: 20px;" title="Keluar"></i>
        </a>
      </li>

    </ul>
  </nav>
</template>

<script>
import Echo from "laravel-echo"
import Pusher from "pusher-js"
import jwt_decode from 'jwt-decode'
export default {
  methods: {
    logout() {
     this.$store.dispatch('logout').then(() => {
        this.$router.push({name: 'HomePage'})
      });
    },

    listen(){
      window.Echo = new Echo({
          broadcaster: 'pusher',
          key: 'fec02e47bf8fdcf0bd9b',
          cluster: 'ap1',
          encrypted: true,
          auth: {
              headers: {
                  Authorization: 'Bearer ' + localStorage.getItem("token")
              },
          },

      });


      if(localStorage.getItem("token")) {
          let decoded = jwt_decode(localStorage.getItem("token"));
          window.Echo.private(`App.User.`+decoded.sub)
          .notification((notification) => {
              console.log(notification);
              this.$store.dispatch('addNotif',notification).then(() => {});
          });

      }
    }
  },

  created(){
    this.listen();
  },

  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    }
  }

}
</script>
<style>
.top-navbar-fixed {
  width: 480px;
  position: fixed;
  top: 0;
  z-index: 1;
}
.left-nav {
  min-height: 50px;
  min-width: 85%;
  background: #FAFCFE;
  box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.15);
  border-radius: 12px;
  padding-left: 10px;
  padding-right: 10px;
}
.input-search {
  border: none;
  background-color: inherit;
}
.input-search:focus {
  outline-width: 0;
}

</style>
