<template>
  <div style="height: 100vh;position: relative;">
    <div>
      <div class="container bg-white" style="box-shadow: 0 2px 2px rgba(0, 0, 0, 0.15);">
        <div class="d-flex align-items-center py-3 text-14">
          <div @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }})">
            <i class="fas fa-arrow-left" style="color: #008FD7;font-size: 20px;"></i>
          </div>
          <div class="reward-header ml-5">Pilih Hadiah Anda</div>
        </div>
      </div>
      <div class="container d-flex mt-5 reward-horizontal">
        <div class="card-reward mr-3">
          <div class="card-body card-reward-content">
            <div class="reward-header mb-3">
              Dukung dengan Donasi (tanpa hadiah)
            </div>
            <div class="text-primary text-14" style="font-weight: 600">5 Backer</div>
            <div class="text-primary text-14">sisa kuota: <span style="font-weight: 600">10 Backer</span></div>
            <p class="mt-3 mb-5">
              Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.  
            </p>
            <button class="btn btn-primary btn-block">Pilih</button>
          </div>
        </div>
        <div class="card-reward mr-3">
          <div class="card-body card-reward-content">
            <div class="reward-header mb-3">
              Dukung dengan Donasi (tanpa hadiah)
            </div>
            <div class="text-primary text-14" style="font-weight: 600">5 Backer</div>
            <div class="text-primary text-14">sisa kuota: <span style="font-weight: 600">10 Backer</span></div>
            <p class="mt-3 mb-5">
              Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.  
            </p>
            <button class="btn btn-primary btn-block">Pilih</button>
          </div>
        </div>
        <div class="card-reward mr-3">
          <div class="card-body card-reward-content">
            <div class="reward-header mb-3">
              Dukung dengan Donasi (tanpa hadiah)
            </div>
            <div class="text-primary text-14" style="font-weight: 600">5 Backer</div>
            <div class="text-primary text-14">sisa kuota: <span style="font-weight: 600">10 Backer</span></div>
            <p class="mt-3 mb-5">
              Mendukung tanpa hadiah, khusus untuk para backer super ikhlas dan percaya pada kemampuan kreator untuk mewujudkan kreasinya.  
            </p>
            <button class="btn btn-primary btn-block">Pilih</button>
          </div>
        </div>
      </div>
    </div>
    
    <div class="container d-flex bottom-wrapper">
      <div class="d-flex align-items-center justify-content-center mr-2 share-button" @click="is_show_share = true">
        <i class="fa fa-share-alt text-20"></i>
      </div>
      <button class="btn btn-primary btn-block"><b>Dukung</b></button>
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
  name: "CampaignReward",
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
.reward-header {
  font-style: normal;
  font-weight: 700;
  font-size: 20px;
  line-height: 140%;
  color: #001B29;
}
.reward-horizontal {
  overflow-x: scroll;
}
.reward-horizontal::-webkit-scrollbar-track {
  background: var(--blue-light);
}
.reward-horizontal::-webkit-scrollbar-thumb {
  background-color: var(--primary);
  border-radius: 6px;
  border: 3px solid var(--primary);
}
/* ::-webkit-scrollbar {
  height: 4px;
  width: 4px;
  background-color: var(--primary);
  border: 1px solid #d5d5d5;
} */
.card-reward {
  background-color: #FFFFFF;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.15);
  border-radius: 16px;
}
.card-reward-content {
  width: 270px;
  padding: 20px 20px 30px;
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
.no-bottom-radius {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
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
  border: 1px solid var(--primary);
  color: var(--primary);
  cursor: pointer;
}
</style>
