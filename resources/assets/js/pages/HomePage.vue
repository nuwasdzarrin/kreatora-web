<template>
  <div>
    <TopNavbar :search.sync="search" />
    <div class="container pt-3 mb-3 homepage-content" id="infinite-list">
      <div>
<!--        <HomeWalletComponent :amount="walletAmount" v-if="isLoggedIn"/>-->
        <NotLoginComponent class="mb-2" v-if="!isLoggedIn" />
        <CampaignCategory :originData="campaign_categories" @onCategoryClick="onCategoryClick" v-if="!is_search"/>
      </div>
      <CampaignVerticalList :title='`Hasil Pencarian "${search}..."`' :data="campaigns_search" :clickBack="false" :isSearch="is_search" v-if="is_search"/>
      <div class="homepage-list">
        <CampaignVerticalList :title="category_selected ? category_selected.name : (is_search ? 'Mungkin kamu suka':'Semua')" :data="campaigns" :categories="campaign_categories" :clickBack="false"/>
      </div>
<!--        <div v-if="urlType">-->
<!--          <CampaignVerticalList :title="campaignVerticalListTitle" :data="campaigns" @onClickBack="onClickBack"/>-->
<!--        </div>-->
<!--        <div v-else>-->
<!--          <CampaignHorizontalList title="Trending" :data="campaign_home.trending" url="trending" @onClickSeeAll="onClickSeeAll" />-->
<!--          <CampaignHorizontalList title="Akan Berakhir" :data="campaign_home.will_end" url="will_end" @onClickSeeAll="onClickSeeAll" />-->
<!--          <CampaignHorizontalList title="Populer" :data="campaign_home.popular" url="popular" @onClickSeeAll="onClickSeeAll" />-->
<!--          <CampaignHorizontalList title="Semua" :data="campaign_home.latest" url="latest" @onClickSeeAll="onClickSeeAll" />-->
<!--        </div>-->
<!--        <div class="spacer"></div> -->
<!--        <BottomNavbar />-->
    </div>
    <loading 
      :active.sync="is_loading"
      :can-cancel="false"
      :is-full-page="true"
      color="#008FD7"
    ></loading>
  </div>
</template>

<script>
import NotLoginComponent from "../components/alerts/NotLoginComponent";
import CampaignHorizontalList from "../components/homepage/CampaignHorizontalList";
import HomeWalletComponent from "../components/wallets/HomeWalletComponent";
import Apis from "../apis";
import CampaignVerticalList from "../components/homepage/CampaignVerticalList";
import CampaignCategory from "../components/homepage/CampaignCategory";

export default {
  name: "HomePage",
  components: {
    CampaignVerticalList,
    HomeWalletComponent,
    CampaignHorizontalList,
    CampaignCategory,
    NotLoginComponent
  },
  data() {
    return {
      is_loading: false,
      is_search: false,
      search: '',
      campaigns_search: [],
      campaigns: [],
      campaign_categories: [],
      category_selected: null,
      page: 1
    }
  },
  watch: {
    'search': function(n, o) {
      if (n!== o) this.fetchSearchCampaign();
    }
  },
  methods: {
    fetchProfile(){
      if (!this.isLoggedIn) return
      Apis.user.profile().then(({data}) => {
        this.$store.commit('SET_USER', data.data)
      }).catch((error) => {
        throw error
      })
    },
    fetchSearchCampaign(){
      this.$set(this, 'is_loading', true);
      Apis.campaign.index({
        search: this.search
      }).then(({data}) => {
        this.$set(this, 'campaigns_search', data.data);
        this.$set(this, 'is_search', true);
        this.$set(this, 'category_selected', null);
        this.$set(this, 'is_loading', false);
        this.fetchCampaign();
      }).catch((error) => {
        this.$set(this, 'is_loading', false);
        throw error
      })
    },
    fetchCampaign(load_more = false){
      load_more ? this.page++ : this.page=1;
      if(!this.search) this.$set(this, 'is_search', false);
      this.$set(this, 'is_loading', true);
      Apis.campaign.index({
        campaign_category_id: this.category_selected ? this.category_selected.id : '',
        page: this.page
      }).then(({data}) => {
        if (load_more) {
          this.$set(this, 'campaigns', this.campaigns.concat(data.data));
        } else this.$set(this, 'campaigns', data.data);
        this.$set(this, 'is_loading', false);
      }).catch((error) => {
        this.$set(this, 'is_loading', false);
        throw error;
      })
    },
    fetchCampaignCategory(){
      Apis.campaign_category.index().then(({data}) => {
        this.$set(this, 'campaign_categories', data.data);
      }).catch((error) => {
        throw error
      })
    },
    onCategoryClick(payload) {
      this.$set(this, 'category_selected', payload ? payload : null);
      this.fetchCampaign();
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
      return this.$route.query.type ? this.$route.query.type : '';
    },
    campaignVerticalListTitle() {
      if(this.urlType === 'trending') return "Trending";
      else if (this.urlType === 'will_end') return "Akan Berakhir";
      else if (this.urlType === 'popular') return "Populer";
      else if (this.urlType === 'latest') return "Terbaru";
      else return "";
    },
    // profile() {
    //   return this.$store.getters.authUser;
    // },
    // walletAmount() {
    //   if (this.profile.wallet) return parseFloat(this.profile.wallet.balance);
    //   return 0;
    // },
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    }
  },
  mounted() {
    this.fetchProfile();
    this.fetchCampaign()
    this.fetchCampaignCategory()
    // this.urlType ? this.fetchCampaign() : this.fetchHomeCampaign();

    // Detect when scrolled to bottom.
    const listElm = document.querySelector('#infinite-list');
    listElm.addEventListener('scroll', e => {
      if(listElm.scrollTop + listElm.clientHeight >= listElm.scrollHeight) {
        this.fetchCampaign(true);
      }
    });
  }
}
</script>

<style scoped>
.homepage-content {
  display: flex; 
  flex-direction: column;
  height: calc(100vh - 50px);
  flex: 1;
  overflow-x: hidden;
  scrollbar-width: thin;
}
.spacer {
  height: 50px;
}
</style>
