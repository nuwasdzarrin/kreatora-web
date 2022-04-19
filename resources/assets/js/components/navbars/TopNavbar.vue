<template>
  <nav class="navbar navbar-expand navbar-light bg-primary">
    <!-- Left navbar links -->
    <a class="navbar-brand mr-auto" href="#">
      <img src="/assets_app/images/logo/icon-logo-kreatora-small.png" alt="logo-kreatora" class="header-logo-kreatora">
    </a>
    <ul class="navbar-nav left-nav">
      <li class="nav-item d-flex align-items-center">
        <a class="nav-link" data-widget="pushmenu" href="javascript:void(0)" @click="onSearch"><i class="fa fa-search"></i></a>
      </li>
      <li class="nav-item d-flex ml-1" style="flex: 1">
        <input type="text" class="input-search" placeholder='Coba cari "ide hebat"' v-model="q" @keyup.enter="onSearch">
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <!--   <notification-list />-->
      <li class="nav-item">
        <img :src="(profile && profile.avatar) ? api.storage + profile.avatar : api.no_image" alt="avatar" class="nav-link header-account" style="padding: 0;" v-if="isLoggedIn" @click="logout">
        <a href="#" class="nav-link text-primary text-center header-account bg-white" v-else>
          <i class="far fa-user" style="font-size: 20px;" title="Keluar"></i>
        </a>
      </li>

    </ul>
  </nav>
</template>

<script>
import jwt_decode from 'jwt-decode'
import Apis from "../../apis"
export default {
  name: 'TopNavbar',
  props: {
    search: String
  },
  data: function() {
    return {
      q: this.search,
      api: Apis
    }
  },
  methods: {
    onSearch() {
      this.$emit('update:search', this.q)
    },
    logout() {
      this.$store.dispatch('logout').then(() => {
        this.$router.push({name: 'HomePage'})
      });
    },

    listen(){
      // window.Echo = new Echo({
      //     broadcaster: 'pusher',
      //     key: 'fec02e47bf8fdcf0bd9b',
      //     cluster: 'ap1',
      //     encrypted: true,
      //     auth: {
      //         headers: {
      //             Authorization: 'Bearer ' + localStorage.getItem("token")
      //         },
      //     },

      // });


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
    },
    profile() {
      return this.$store.getters.authUser;
    }
  }

}
</script>
<style lang="css" scoped>
.header-logo-kreatora {
  margin-left: -12px;
}
@media screen and (max-width: 350px) {
  .header-logo-kreatora {
    margin-left: -15px;
    width: 40px;
    height: auto;
  }
}
.top-navbar-fixed {
  width: 480px;
  position: fixed;
  top: 0;
  z-index: 1;
}
.left-nav {
  min-height: 50px;
  min-width: 75%;
  background: #FAFCFE;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
  border-radius: 12px;
  padding-left: 10px;
  padding-right: 10px;
}
.input-search {
  flex: 1;
  border: none;
  background-color: inherit;
}
@media screen and (max-width: 330px) {
  .left-nav{
    min-width: 65%;
    padding-left: 2px;
    padding-right: 2px;
  }
  .input-search {
    width: 170px;
  }
}
.input-search:focus {
  outline-width: 0;
}
.header-account {
  border-radius: 50%;
  width: 40px;
  height: 40px;
}
</style>
