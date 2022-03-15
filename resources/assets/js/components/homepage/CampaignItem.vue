<template>
  <div :class="parent === 'CampaignVerticalList'?'vertical-campaign-item-card':'campaign-item-card'" @click="$router.push({ name: isLoggedIn ? 'DashboardCampaignDetail' : 'CampaignDetail', params: { slug: item.title }})" v-if="item">
    <img :src="api.storage + item.pictures[0]" alt="img-campaign" :class="parent === 'CampaignVerticalList'?'vertical-campaign-item-img':'campaign-item-img'">
    <div class="p-3">
      <h6><strong>{{item.title}}</strong></h6>
      <div class="d-flex justify-content-between campaign-meta mb-1">
        <div>oleh : <span class="campaign-author">{{item.creator_name}}</span></div>
        <div>3 hari tersisa</div>
      </div>
      <div class="progress mb-1" style="height: 5px;">
        <div class="progress-bar bg-primary" role="progressbar" :style="'width: '+fundedPercent+'%'" :aria-valuenow="fundedPercent" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="d-flex justify-content-between campaign-meta mb-1">
        <div><i class="fa fa-user mr-1"></i><strong>{{item.total_backer}} Backer</strong></div>
        <div><i class="fa fa-hourglass mr-1"></i><strong>{{fundedPercent}}% Funded</strong></div>
      </div>
    </div>
  </div>
</template>

<script>
import Apis from "../../apis";
export default {
  name: "CampaignItem",
  props: {
    parent: String,
    item: {
      type: Object
    }
  },
  data: function () {
    return {
      api: Apis
    }
  },
  computed: {
    fundedPercent() {
      return Math.round((this.item.total_funded / this.item.goal) * 100)
    },
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    }
  }
}
</script>

<style scoped>
.campaign-item-card {
  max-width: 256px;
  background: #FAFCFE;
  box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.12);
  border-radius: 12px;
  margin-right: 10px;
}
.campaign-item-img {
  width: 256px;
  height: 152px;
  border-top-left-radius: 12px;
  border-top-right-radius: 12px;
  margin-bottom: 10px;
}
.vertical-campaign-item-card {
  background: #FAFCFE;
  box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.12);
  border-radius: 12px;
  margin-bottom: 20px;
}
.vertical-campaign-item-img {
  width: 100%;
  height: auto;
  border-top-left-radius: 12px;
  border-top-right-radius: 12px;
  margin-bottom: 10px;
}
.campaign-meta {
 font-size: 12px;
}
.campaign-author {
  color: #008FD7;
}
</style>
