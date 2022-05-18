<template>
  <div>
    <div>
      <TopNavbarBlock title="Detail Dukung" :routes="{auth: `Dashboard${back_button}`, not_auth: back_button}" />
      <div class="container">
        <div class="title-detail mt-3 mb-4">Status Dukungan</div>
        <div class="my-2">Campaign yang didukung</div>
        <div class="row mb-4">
          <div class="col-4">
            <img :src="(detail_campaign && detail_campaign.pictures) ? (api.storage + detail_campaign.pictures[0]) : api.no_image" alt="campaign-images" class="backer-img">
          </div>
          <div class="col-8">
            <div class="title-campaign mb-1">Game Dadu Mengasah Otak</div>
            <div class="kreator-campaign">Simon Samin <i class="fas fa-certificate ml-1" style="color: #008FD7;"></i></div>
          </div>
        </div>
        <table class="mb-4">
          <tr>
            <td>Metode Pembayaran</td>
            <td>: BCA Virtual Account</td>
          </tr>
          <tr>
            <td>ID Donasi</td>
            <td>: #123456</td>
          </tr>
          <tr>
            <td>Status</td>
            <td>: <span class="badge badge-pill badge-success">Success</span></td>
          </tr>
        </table>
        <div class="d-flex justify-content-center mt-5">
          <button class="btn btn-primary">Cek Status Pembayaran</button>
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
import _ from "lodash"
import moment from "moment";
import TopNavbarBlock from "../../components/navbars/TopNavbarBlock";

export default {
  name: "MyBackerDetail",
  components: {
    TopNavbarBlock
  },
  data() {
    return {
      lodash: _,
      api: Apis,
      is_loading: false,
      back_button: 'MyBacker',
      detail_campaign: {}
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
    profile() {
      return this.$store.getters.authUser;
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
      }).catch((error) => {
        this.$set(this, 'is_loading', false)
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
.title-detail {
  text-align: center;
  font-weight: 700;
  font-size: 24px;
  line-height: 120%;
  color: #000
}
.title-campaign {
  font-weight: 700;
  font-size: 16px;
  line-height: 140%;
  color: #23232E;
}
.kreator-campaign {
  font-weight: 700;
  font-size: 10px;
  line-height: 14px;
  color: #008FD7;
}
.backer-img {
  width: 130px;
  height: 75px;
  object-fit: contain;
}
</style>
