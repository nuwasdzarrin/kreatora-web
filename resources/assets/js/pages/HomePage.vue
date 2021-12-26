<template>
<div class="mt-4">
<!--  <NotLoginComponent />-->
  <HomeWalletComponent />
  <CampaignHorizontalList title="Trending" :data="campaign_home.trending" />
  <CampaignHorizontalList title="Akan Berakhir" :data="campaign_home.will_end" />
  <CampaignHorizontalList title="Populer" :data="campaign_home.popular" />
  <CampaignHorizontalList title="Terbaru" :data="campaign_home.latest" />
  <div class="spacer"></div>
  <BottomNavbar />
</div>
</template>

<script>
import NotLoginComponent from "../components/alerts/NotLoginComponent";
import CampaignHorizontalList from "../components/homepage/CampaignHorizontalList";
import HomeWalletComponent from "../components/wallets/HomeWalletComponent";
import Apis from "../apis";

export default {
  name: "HomePage",
  components: {
    HomeWalletComponent,
    CampaignHorizontalList,
    NotLoginComponent
  },
  data() {
    return {
      campaign_home: {}
    }
  },
  methods: {
    fetchHomeCampaign(){
      Apis.campaign.index().then(({data}) => {
        this.$set(this, 'campaign_home', data.data);
      }).catch((error) => {
        throw error
      })
    }
  },
  mounted() {
    this.fetchHomeCampaign()
  }
}
</script>

<style scoped>
.spacer {
  height: 50px;
}
</style>
