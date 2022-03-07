<template>
  <div>
    <NoTopNavbar />
    <div class="container">
      <div class="mt-5">
        <div class="d-flex justify-content-between mb-3">
          <div class="d-flex">
            <img src="/assets_homepage/img/team/team-2.jpg" alt="avatar image" class="avatar-image">
            <div class="ml-3">
              <h4 class="font-weight-bold mb-2 aacount-username">Nama Pengguna</h4>
              <div class="mb-2">nama@gmail.com</div>
              <div class="d-flex">
                <div class="tag-info mr-2">backer pemula</div>
                <div class="tag-warning">kreator pemula</div>
              </div>
            </div>
          </div>
          <div>
            <a href="#" class="font-weight-bold">edit</a>
          </div>
        </div>
        <hr class="account-hr">
        <HomeWalletComponent :amount="walletAmount" v-if="isLoggedIn"/>
        <NotLoginComponent v-else />
        <div v-if="urlType">
          <CampaignVerticalList :title="campaignVerticalListTitle" :data="campaigns" @onClickBack="onClickBack"/>
        </div>
        <div v-else>
          <CampaignHorizontalList title="Trending" :data="campaign_home.trending" url="trending" @onClickSeeAll="onClickSeeAll" />
          <CampaignHorizontalList title="Akan Berakhir" :data="campaign_home.will_end" url="will_end" @onClickSeeAll="onClickSeeAll" />
          <CampaignHorizontalList title="Populer" :data="campaign_home.popular" url="popular" @onClickSeeAll="onClickSeeAll" />
          <CampaignHorizontalList title="Terbaru" :data="campaign_home.latest" url="latest" @onClickSeeAll="onClickSeeAll" />
        </div>
        <div class="spacer"></div>
        <BottomNavbar />
      </div>
    </div>
  </div>
</template>

<script>
import NotLoginComponent from "../components/alerts/NotLoginComponent";
import CampaignHorizontalList from "../components/homepage/CampaignHorizontalList";
import HomeWalletComponent from "../components/wallets/HomeWalletComponent";
import Apis from "../apis";
import CampaignVerticalList from "../components/homepage/CampaignVerticalList";

export default {
  name: "Account",
  components: {
    CampaignVerticalList,
    HomeWalletComponent,
    CampaignHorizontalList,
    NotLoginComponent
  },
  data() {
    return {
      profile: {},
      campaign_home: {},
      campaigns: []
    }
  },
  methods: {
    fetchProfile(){
      if (!this.isLoggedIn) return
      Apis.user.profile().then(({data}) => {
        this.$set(this, 'profile', data);
      }).catch((error) => {
        throw error
      })
    },
    fetchHomeCampaign(){
      Apis.campaign.home().then(({data}) => {
        this.$set(this, 'campaign_home', data.data);
      }).catch((error) => {
        throw error
      })
    },
    fetchCampaign(){
      Apis.campaign.index({
        type: this.urlType
      }).then(({data}) => {
        this.$set(this, 'campaigns', data.data);
      }).catch((error) => {
        throw error
      })
    },
    onClickSeeAll(payload) {
      this.$router.push({ name: this.isLoggedIn ? 'DashboardHomePage':'HomePage', query: { type: payload } }).then(()=>{
        this.fetchCampaign();
      })
      .catch(err => {
        if (err.name !== 'NavigationDuplicated' &&!err.message.includes('Avoided redundant navigation to current location')) {
          console.log(err);
        }
      });
    },
    onClickBack() {
      this.$router.push({ name: this.isLoggedIn ? 'DashboardHomePage':'HomePage'}).then(()=>{
        this.fetchHomeCampaign();
      })
      .catch(err => {
        if (err.name !== 'NavigationDuplicated' &&!err.message.includes('Avoided redundant navigation to current location')) {
          console.log(err);
        }
      });
    }
  },
  computed: {
    urlType() {
      return this.$route.query.type;
    },
    campaignVerticalListTitle() {
      if(this.urlType === 'trending') return "Trending";
      else if (this.urlType === 'will_end') return "Akan Berakhir";
      else if (this.urlType === 'popular') return "Populer";
      else if (this.urlType === 'latest') return "Terbaru";
      else return "";
    },
    walletAmount() {
      if (this.profile.wallet) return parseFloat(this.profile.wallet.balance);
      return 0;
    },
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    }
  },
  mounted() {
    this.fetchProfile();
    this.urlType ? this.fetchCampaign() : this.fetchHomeCampaign();
  }
}
</script>

<style scoped>
.spacer {
  height: 50px;
}
.avatar-image {
  width: 100px;
  height: 100px;
  border-radius: 50%;
}
.account-username {
  color: #001B29;
}
.account-hr {
  opacity: 0.4;
  border: 1px solid #23232E;
}
.tag-info {
  background: #C8ECFF;
  padding: 4px 8px;
  border-radius: 6px;
  color: #001B29;
  font-weight: 600;
}
.tag-warning {
  background: #FFE2C8;
  padding: 4px 8px;
  border-radius: 6px;
  color: #001B29;
  font-weight: 600;
}
</style>
