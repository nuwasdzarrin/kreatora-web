<template>
  <div class="account-wrapper">
    <TopNavbarBlock title="Akun"/>
    <div class="container">
      <div class="mt-5">
        <div class="d-flex justify-content-between mb-3">
          <div class="d-flex">
            <img :src="(profile && profile.avatar) ? api.storage + profile.avatar : api.no_image"
                 alt="avatar image" class="avatar-image"
            >
            <div class="ml-3">
              <h4 class="mb-2 account-username">{{profile.name}}</h4>
              <div class="mb-2 account-email">{{profile.email}}</div>
              <div class="row">
                <div class="col-12 col-md-6 px-2">
                  <div class="tag tag-info">backer pemula</div>
                </div>
                <div class="col-12 col-md-6 px-2" v-if="profile.role_name==='Kreator'">
                  <div class="tag tag-warning">kreator pemula</div>
                </div>
              </div>
            </div>
          </div>
          <div>
            <a href="#" class="font-weight-bold">edit</a>
          </div>
        </div>
        <hr class="account-hr">
        <div class="d-flex align-items-center justify-content-between list-menu">
          <div>
            <div class="title-list mb-2">Jadi Kreator</div>
            <div class="desc-list">Hubungi Kreatora untuk menjadi Kreator</div>
          </div>
          <i class="fa fa-chevron-right"></i>
        </div>
        <div class="d-flex align-items-center justify-content-between list-menu" @click="$router.push({name: 'DashboardMyBacker'})">
          <div>
            <div class="title-list mb-2">Riwayat Dukungan</div>
            <div class="desc-list">Lihat riwayat dukungan yang telah kamu berikan</div>
          </div>
          <i class="fa fa-chevron-right"></i>
        </div>
        <div class="d-flex align-items-center justify-content-between list-menu">
          <div>
            <div class="title-list mb-2">Community Guideline</div>
            <div class="desc-list">Pelajari lebih lanjut tentang Kreatora</div>
          </div>
          <i class="fa fa-chevron-right"></i>
        </div>
        <div class="d-flex align-items-center justify-content-between list-menu" @click="logout">
          <div class="title-list" style="color: #D70000;">Sign Out</div>
          <i class="fa fa-chevron-right" style="color: #D70000;"></i>
        </div>
        <div class="spacer"></div>
<!--        <BottomNavbar />-->
      </div>
    </div>
    <div class="container kreatora-version">Kreatora v 0.0.4.128</div>
  </div>
</template>

<script>
import Apis from "../../apis";
import TopNavbarBlock from "../../components/navbars/TopNavbarBlock";

export default {
  name: "Account",
  components: {TopNavbarBlock},
  data() {
    return {
      api: Apis,
      profile: {}
    }
  },
  methods: {
    fetchProfile() {
      if (!this.isLoggedIn) return
      Apis.user.profile().then(({data}) => {
        this.$set(this, 'profile', data.data);
      }).catch((error) => {
        throw error
      })
    },
    logout() {
      this.$store.dispatch('logout').then(() => {
        this.$router.push({name: 'HomePage'})
      });
    },
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
  },
  mounted() {
    this.fetchProfile();
  }
}
</script>

<style scoped>
.account-wrapper {
  position: relative;
  height: 100vh;
  background-color: #FAFCFE;
}
.spacer {
  height: 50px;
}
.avatar-image {
  width: 100px;
  height: 100px;
  border-radius: 50%;
}
.account-username {
  font-weight: 700;
  font-size: 24px;
  line-height: 120%;
  color: #001B29;
}
.account-email {
  font-weight: 600;
  font-size: 14px;
  line-height: 140%;
  color: #5C5C70;
}
.account-hr {
  opacity: 0.4;
  height:1px;
  border-width:0;
  background-color:#23232E
}
.tag {
  width: 130px;
  padding: 4px 8px;
  border-radius: 6px;
  color: #001B29;
  font-weight: 600;
  text-align: center;
  margin-bottom: 5px;
}
/*@media screen and (max-width: 450px) {*/
/*  .tag {*/
/*    font-size: 14px;*/
/*    padding: 4px 5px;*/
/*  }*/
/*}*/
/*@media screen and (max-width: 400px) {*/
/*  .tag {*/
/*    font-size: 12px;*/
/*    padding: 4px;*/
/*  }*/
/*}*/
/*@media screen and (max-width: 350px) {*/
/*  .tag {*/
/*    font-size: 8px;*/
/*    padding: 2px;*/
/*  }*/
/*}*/
.tag-info {
  background: #C8ECFF;
}
.tag-warning {
  background: #FFE2C8;
}
.list-menu {
  margin: 15px 0;
  padding: 10px 0;
  cursor: pointer;
}
.title-list {
  font-weight: 700;
  font-size: 16px;
  line-height: 140%;
  color: #001B29;
}
.desc-list {
  font-weight: 400;
  font-size: 12px;
  line-height: 16px;
  color: #5C5C70;
}
.kreatora-version {
  font-weight: 400;
  font-size: 10px;
  line-height: 14px;
  color: #000000;
  opacity: 0.25;

  position: absolute;
  left: 0;
  bottom: 10px;
}
</style>
