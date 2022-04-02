<template>
  <div class="bg-white" style="height: 100vh;position: relative;">
    <div v-if="isSection === 'description' || isSection === 'risk' || isSection === 'faq' || isSection === 'update'">
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
          <div class="text-14" :class="{'text-color-black': isSection === 'faq'}" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'faq' }})">
            <b>FAQ</b>
          </div>
          <div class="text-14" :class="{'text-color-black': isSection === 'risk'}" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'risk' }})">
            <b>Risiko</b>
          </div>
          <div class="text-14" :class="{'text-color-black': isSection === 'update'}" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'update' }})">
            <b>Update</b>
          </div>
        </div>
      </div>
      <div class="container" style="height: 80vh; overflow-y: auto;">
        <div v-html="dataSection" v-show="isSection === 'description' || isSection === 'risk'"/>
        <div class="pt-3" v-show="isSection === 'faq'">
          <div class="mb-4" v-for="(item, index) in detail_campaign.faqs" :key="index">
            <div class="faq-question" :class="{'no-bottom-radius': is_faq_open[index]}" @click="openFaq(index)">
              <div style="max-width: 90%">
                {{ item.question }}
              </div>
              <div><i class="fas fa-chevron-right" :class="{'fa-rotate-90': is_faq_open[index]}"></i></div>
            </div>
            <div class="faq-answer" v-show="is_faq_open[index]">
              {{ item.answer }}
            </div>
          </div>
        </div>
        <div class="pt-3" v-show="isSection === 'update'">
          <div class="update-box" v-for="(item, index) in detail_campaign.updates" :key="index">
            <div class="d-flex justify-content-between mb-3 text-12">
              <div><strong>Update #{{item.index}}</strong></div>
              <div style="color: #5C5C70">{{item.updated_at | dateDDMMYYYY}}</div>
            </div>
            <h5><strong>{{item.title}}</strong></h5>
            <p class="text-14" v-html="item.description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi massa tortor vel justo vivamus aliquet. Sed massa lectus sed neque, maecenas enim porttitor ......</p>
            <div class="text-right"><span class="mr-2" style="color: black">11</span><i class="far fa-comment-alt mr-4"></i><span class="mr-2" style="color: black">11</span><i class="far fa-heart"></i></div>
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <div style="position: relative;">
        <img :src="(detail_campaign && detail_campaign.pictures) ? (api.storage + detail_campaign.pictures[0]) : api.no_image" alt="campaign-images" class="campaign-detail-img">
        <span class="back-button-img" @click="$router.push({ name: 'HomePage'})">
          <i class="fas fa-arrow-left"></i>
        </span>
        <img :src="api.storage + 'kreatora-mark.png'" style="position: absolute; bottom: 10px; right: 10px;">
      </div>
      <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3 text-14">
          <div class="campaign-detail-category">
<!--            <i class="fa fa-gamepad"></i> -->
            {{lodash.upperFirst(detail_campaign.category_name || 'semua')}}
          </div>
          <div>
            <i class="far fa-clock"></i> {{ daysLeft }} hari tersisa
          </div>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-4">
          <div class="text-12">
            oleh:
            <img :src="(detail_campaign && detail_campaign.creator_avatar) ? api.storage + detail_campaign.creator_avatar : api.no_image" alt="avatar-creator" class="user-avatar ml-1">
            <strong class="text-color-black">{{lodash.startCase(detail_campaign.creator_name)}}</strong>
            <i class="fas fa-certificate ml-1" style="color: #008FD7;"></i>
          </div>
          <div class="text-14">
            backers:
            <strong class="mr-1">{{detail_campaign.total_backer}}</strong>
            <img :src="api.storage + item" alt="avatar-creator" class="user-avatar avatar-margin-right" v-for="(item, index) in detail_campaign.backer_avatar" :key="index">
          </div>
        </div>
        <h5 class="text-color-black"><strong>{{lodash.startCase(detail_campaign.title)}}</strong></h5>
        <div class="progress my-3" style="height: 5px;">
          <div class="progress-bar bg-primary" role="progressbar" :style="'width: '+fundedPercent+'%'" :aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <div class="d-flex justify-content-between campaign-meta mb-5 text-12">
          <div><strong class="text-color-primary text-14">Rp. {{detail_campaign.total_funded | formatCurrency}}</strong></div>
          <div class="text-14">dari: <strong>Rp. {{detail_campaign.goal | formatCurrency}}</strong></div>
        </div>
        <div class="d-flex justify-content-around align-items-center mb-4 text-14">
          <div class="text-14 text-color-black" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'description' }})">
            <b>Deskripsi</b>
          </div>
          <div class="text-14" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'faq' }})">
            <b>FAQ</b>
          </div>
          <div class="text-14" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'risk' }})">
            <b>Risiko</b>
          </div>
          <div class="text-14" @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'update' }})">
            <b>Update</b>
          </div>
        </div>
        <div class="text-14">
          <div v-html="detail_campaign.short_desc"></div>
          <a href="javascript:void(0)"  @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }, query: { section: 'description' }})">
            baca lebih banyak...
          </a>
        </div>
      </div>
    </div>
    <div class="container d-flex bottom-wrapper">
      <div class="d-flex align-items-center justify-content-center mr-2 share-button" @click="is_show_share = true">
        <i class="fa fa-share-alt text-20"></i>
      </div>
      <button class="btn btn-primary btn-block" @click="$router.push({ name: 'CampaignReward', params: { slug: detail_campaign.title }})"><b>Dukung</b></button>
    </div>
    <modal-share-button :active.sync="is_show_share" :originData="detail_campaign" />
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
import _ from "lodash"
import moment from "moment";
import ModalShareButton from "../../components/modals/ModalShareButton";

export default {
  name: "CampaignDetail",
  components: {
    ModalShareButton
  },
  data() {
    return {
      lodash: _,
      api: Apis,
      is_loading: false,
      is_show_share: false,
      slug: this.$route.params.slug,
      detail_campaign: {},
      is_faq_open: []
    }
  },
  computed: {
    isSection() {
      if (this.$route.query.section === 'description') return 'description'
      else if (this.$route.query.section === 'risk') return 'risk'
      else if (this.$route.query.section === 'faq') return 'faq'
      else if (this.$route.query.section === 'update') return 'update'
      else return null
    },
    dataSection() {
      if (this.$route.query.section === 'description') return this.detail_campaign.long_desc
      else if (this.$route.query.section === 'risk') return this.detail_campaign.risk
      else return null
    },
    fundedPercent() {
      return Math.round((this.detail_campaign.total_funded / this.detail_campaign.goal) * 100)
    },
    daysLeft() {
      let cal = moment(this.detail_campaign.end).diff(moment(), 'days')
      return cal > 0 ? cal : 0
    }
  },
  methods: {
    fetchDetailCampaign() {
      this.$set(this, 'is_loading', true)
      Apis.campaign.slug(this.slug, {}).then(({data}) => {
        this.$set(this, 'is_loading', false)
        this.$set(this, 'detail_campaign', data)
        let vm = this
        this.detail_campaign.faqs.forEach(function (item, index) {
          if (index===0) vm.is_faq_open.push(true)
          else vm.is_faq_open.push(false)
        })
      }).catch((error) => {
        this.$set(this, 'is_loading', false)
        throw error
      })
    },
    openFaq(index) {
      this.$set(this.is_faq_open, index, !this.is_faq_open[index])
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
  margin-right: -10px;
}
.campaign-detail-category {
  padding: 6px 20px;
  border: 1px solid #5C5C70;
  border-radius: 100px;
}
.text-color-black {
  color: #001B29;
}
.text-color-primary {
  color: #008FD7;
;
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
.faq-question {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 15px;
  box-shadow: 4px 4px 15px rgba(0, 0, 0, 0.12);
  border-radius: 12px;
  background: #ECF1F4;
}
.no-bottom-radius {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}
.faq-answer {
  padding: 10px 15px;
  background: #D6E1E8;
  border-bottom-left-radius: 12px;
  border-bottom-right-radius: 12px;
}
.update-box {
  padding: 20px 10px;
  box-shadow: 4px 4px 15px rgba(0, 0, 0, 0.12);
  border-radius: 12px;
}
.campaign-detail-img {
  width: 100%;
  height: 215px;
  object-fit: cover;
}
.bottom-wrapper {
  position: absolute;
  bottom: 15px;
  height: 50px;
}
.share-button {
  box-sizing: border-box;
  width: 60px;
  height: 50px;
  border-radius: 5px;
  border: 1px solid #008FD7;
  color: #008FD7;
  cursor: pointer;
}
</style>
