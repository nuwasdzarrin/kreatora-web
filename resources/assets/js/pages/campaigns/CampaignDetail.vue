<template>
  <div class="bg-white" style="height: 100vh;position: relative;">
    <div v-if="isSection === 'description' || isSection === 'risk'">
      <div class="container" style="box-shadow: 0 2px 2px rgba(0, 0, 0, 0.15);">
        <div class="d-flex justify-content-between align-items-center py-3 text-14">
          <div @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }})">
            <i class="fas fa-arrow-left" style="color: #008FD7;font-size: 20px;"></i>
          </div>
          <div>
            <a href="#" class="mr-2"><i class="far fa-bookmark text-20"></i></a>
            <a href="#"><i class="fa fa-share-alt text-20"></i></a>
          </div>
        </div>
        <div class="d-flex justify-content-between align-items-center py-2 mb-3 text-14">
          <div class="text-14" :class="{'text-color-black': isSection === 'description'}" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'description' }})">
            <b>Deskripsi</b>
          </div>
          <div class="text-14"><b>FAQ</b></div>
          <div class="text-14" :class="{'text-color-black': isSection === 'risk'}" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'risk' }})">
            <b>Risiko</b>
          </div>
          <div class="text-14"><b>Update</b></div>
        </div>
      </div>
      <div class="container" style="height: 80vh; overflow-y: auto;">
        <div v-html="dataSection" />
      </div>
    </div>
    <div v-else>
      <div style="position: relative;">
        <img :src="`/storage/${detail_campaign.images[0]}`" alt="campaign-images" style="width: 100%; height: 215px;">
        <span class="back-button-img" @click="$router.push({ name: 'HomePage'})">
          <i class="fas fa-arrow-left"></i>
        </span>
      </div>
      <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3 text-14">
          <div style="padding: 5px 10px;border: 1px solid #5C5C70;border-radius: 100px;">
            <i class="fa fa-gamepad"></i> {{lodash.upperFirst(detail_campaign.category_name)}}
          </div>
          <div>
            <i class="fa fa-clock"></i> 3 hari tersisa
          </div>
          <div>
            <a href="#" class="mr-2"><i class="far fa-bookmark text-20"></i></a>
            <a href="#"><i class="fa fa-share-alt text-20"></i></a>
          </div>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-4">
          <div class="text-12">
            oleh:
            <img :src="`/storage/${detail_campaign.creator_avatar}`" alt="avatar-creator" class="user-avatar">
            <strong class="text-color-black">{{lodash.startCase(detail_campaign.creator_name)}}</strong>
            <i class="fas fa-certificate ml-1"></i>
          </div>
          <div class="text-12">
            backers:
            <strong class="text-color-black text-14">300+</strong>
            <img src="/assets_app/images/avatar/photo-avatar.jpg" alt="avatar-creator" class="user-avatar avatar-margin-right">
            <img src="/assets_app/images/avatar/photo-avatar.jpg" alt="avatar-creator" class="user-avatar avatar-margin-right">
            <img src="/assets_app/images/avatar/photo-avatar.jpg" alt="avatar-creator" class="user-avatar">
          </div>
        </div>
        <h5 class="text-color-black mb-3"><strong>{{lodash.startCase(detail_campaign.title)}}</strong></h5>
        <div class="progress mb-1 mt-3" style="height: 5px;">
          <div class="progress-bar bg-primary" role="progressbar" :style="'width: '+25+'%'" :aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <div class="d-flex justify-content-between campaign-meta mb-4 text-12">
          <div>Terkumpul: <strong class="text-color-black text-14">Rp. 127.000.000</strong></div>
          <div>Target: <strong class="text-14">Rp. 145.000.000</strong></div>
        </div>
        <div class="d-flex justify-content-around align-items-center mb-4 text-14">
          <div class="text-14 text-color-black" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'description' }})">
            <b>Deskripsi</b>
          </div>
          <div class="text-14"><b>FAQ</b></div>
          <div class="text-14" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'risk' }})">
            <b>Risiko</b>
          </div>
          <div class="text-14"><b>Update</b></div>
        </div>
        <div class="text-14">
          <div v-html="detail_campaign.short_desc"></div>
          <a href="javascript:void(0)"  @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'description' }})">
            baca lebih banyak...
          </a>
        </div>
      </div>
    </div>
    <div class="container" style="position: absolute; bottom: 15px;">
      <button class="btn btn-primary btn-block">DUKUNG</button>
    </div>
  </div>
</template>

<script>
import Apis from "../../apis"
import _ from "lodash"

export default {
  name: "CampaignDetail",
  data() {
    return {
      lodash: _,
      slug: this.$route.params.slug,
      detail_campaign: {}
    }
  },
  computed: {
    isSection() {
      if (this.$route.query.section === 'description') return 'description'
      else if (this.$route.query.section === 'risk') return 'risk'
      else return ''
    },
    dataSection() {
      if (this.$route.query.section === 'description') return this.detail_campaign.long_desc
      else if (this.$route.query.section === 'risk') return this.detail_campaign.risk
      else return ''
    }
  },
  methods: {
    fetchDetailCampaign() {
      Apis.campaign.slug(this.slug, {}).then(({data}) => {
        this.$set(this, 'detail_campaign', data)
      }).catch((error) => {
        throw error
      })
    }
  },
  mounted() {
    this.fetchDetailCampaign()
  }
}
</script>

<style scoped>
.user-avatar {
  width: 25px;
  height: 25px;
  border-radius: 50%;
}
.avatar-margin-right {
  margin-right: -17px;
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
.back-button-img {
  height: 35px;
  width: 35px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #FFFFFF;
  box-shadow: 4px 4px 15px rgba(0, 0, 0, 0.12);
  border-radius: 8px;
  position: absolute;
  left: 15px;
  top: 15px;
  color: #008FD7;
  font-size: 20px;
}
</style>
