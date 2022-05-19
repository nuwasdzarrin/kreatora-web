<template>
  <div style="height: 100vh; position: relative;">
    <div class="container bg-white" style="box-shadow: 0 2px 2px rgba(0, 0, 0, 0.15);">
      <div class="d-flex align-items-center py-3 text-14">
        <div @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }})"  style="cursor: pointer;">
          <i class="fas fa-arrow-left" style="color: #008FD7;font-size: 20px;"></i>
        </div>
        <div class="reward-header ml-5">Pilih Hadiah Anda</div>
      </div>
    </div>
    <div class="container d-flex mt-5 reward-horizontal">
      <div class="mr-3" v-for="(item, index) in detail_campaign.rewards" :key="index">
        <div class="card-reward-content">
          <div class="reward-header mb-3">
            {{ item.title }}
          </div>
          <div class="text-primary text-14" style="font-weight: 600">{{ item.total_backer }} Backer</div>
          <div class="text-primary text-14">sisa kuota: <span style="font-weight: 600">{{ remainingBacker(item) }} Backer</span></div>
          <p class="mt-3 mb-5" v-html="item.description"></p>
          <button class="btn btn-primary btn-block" :disabled="remainingBacker(item) == 0" @click="$router.push({ name: 'CampaignSupport', params: { slug: detail_campaign.title }, query: { reward: item.id }})">Pilih</button>
        </div>
      </div>
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
import Apis from "../../apis"

export default {
  name: "CampaignReward",
  data() {
    return {
      api: Apis,
      is_loading: false,
      slug: this.$route.params.slug,
      detail_campaign: {},
    }
  },
  methods: {
    fetchDetailCampaign() {
      this.$set(this, 'is_loading', true)
      Apis.campaign.slug(this.slug, {}).then(({data}) => {
        this.$set(this, 'is_loading', false)
        this.$set(this, 'detail_campaign', data)

      }).catch((error) => {
        this.$set(this, 'is_loading', false)
        throw error
      })
    },
    remainingBacker(item) {
      return item.max_backer ? (item.max_backer - item.total_backer) : '~'
    }
  },
  mounted() {
    this.fetchDetailCampaign()
  //  trigger push
  }
}
</script>

<style scoped>
.reward-header {
  font-style: normal;
  font-weight: 700;
  font-size: 20px;
  line-height: 140%;
  color: #001B29;
}
.reward-horizontal {
  overflow-x: scroll;
  height: 85vh;
}
.reward-horizontal::-webkit-scrollbar-track {
  background-color: var(--blue-light);

}
.reward-horizontal::-webkit-scrollbar-thumb {
  background-color: var(--primary);
  border-radius: 6px;
  width: 3px;
  border: 3px solid var(--primary);
}
::-webkit-scrollbar {
  -webkit-appearance: none;
  height: 7px;
}
.card-reward-content {
  width: 270px;
  padding: 20px 20px 30px;
  background-color: #FFFFFF;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.15);
  border-radius: 16px;
}
.text-color-black {
  color: #001B29;
}
.text-12 {
  font-size: 12px;
}
.text-14 {
  font-size: 14px;
}
.text-20 {
  font-size: 20px;
}
</style>
