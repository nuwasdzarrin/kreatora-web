<template>
  <div>
    <div class="wrapper-detail">
      <TopNavbarBlock title="Detail Dukung" :routes="backButton" />
      <div class="container mt-3">
        <div class="title-detail mt-3 mb-4">Status Dukungan</div>
        <div class="my-2">Campaign yang didukung</div>
        <div class="row mb-4">
          <div class="col-4">
            <img :src="(detail.campaign && detail.campaign.pictures) ? (api.storage + detail.campaign.pictures[0]) : api.no_image" alt="campaign-images" class="backer-img">
          </div>
          <div class="col-8">
            <div class="title-campaign mb-1">{{detail.campaign ? detail.campaign.title : ''}}</div>
            <div class="kreator-campaign">{{detail.campaign ? detail.campaign.creator_name : ''}} <i class="fas fa-certificate ml-1" style="color: #008FD7;"></i></div>
          </div>
        </div>
        <table class="mb-4">
          <tr>
            <td>Metode Pembayaran</td>
            <td>: BCA Virtual Account</td>
          </tr>
          <tr>
            <td>ID Donasi</td>
            <td>: #{{detail.payment ? detail.payment.order_id : ''}}</td>
          </tr>
          <tr v-if="detail">
            <td>Status</td>
            <td>: <span class="badge badge-pill" :class="statusProcess(detail && detail.payment && detail.payment.status)" style="text-transform: capitalize">
              {{ (detail && detail.payment) ? detail.payment.status || 'Pending' : 'Menunggu' }}
            </span></td>
          </tr>
        </table>
        <div class="d-flex justify-content-center mt-5" v-if="detail">
          <button class="btn btn-primary" @click="$router.push({
            name: 'HomePage',
          })" v-if="detail && detail.payment.status == 'settlement'">Cek Campaign Lainnya</button>
          <button class="btn btn-danger" @click="$router.push({
            name: 'CampaignDetail',
            params: { slug: detail.campaign ? detail.campaign.title : '' }
          })" v-else-if="detail && detail.payment.status == 'expire'">Ulangi Donasi</button>
          <div class="text-center" v-else>
            <button class="btn btn-success" @click="fetchMyBackerDetail">Cek Status Pembayaran</button><br/><br/>
            <a href="javascript:void(0)" class="payment-method" @click="onLoadSnapMidtrans">Cara Pembayaran</a>
          </div>
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
import config from "../../config";

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
      order_id: this.$route.query.order_id,
      detail: {
        payment: {
          status: ''
        }
      }
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
    backButton() {
      if (this.isLoggedIn) return 'DashboardMyBacker'
      return 'HomePage'
    }
  },
  methods: {
    fetchMyBackerDetail() {
      this.$set(this, 'is_loading', true)
      Apis.my_backer.show(this.order_id).then(({data}) => {
        this.$set(this, 'is_loading', false)
        if (Object.keys(data.data).length) return this.$set(this, 'detail', data.data)
        else {
          this.$toastr.e(data.message)
          return this.$router.push({name: 'HomePage'})
        }
      }).catch((error) => {
        this.$set(this, 'is_loading', false)
        throw error
      })
    },
    onLoadSnapMidtrans() {
      if (this.detail.payment && this.detail.payment.transaction_id)
        snap.pay(this.detail.payment.transaction_id)
    },
    statusProcess(status) {
      if (status == 'settlement') return 'badge-primary'
      else if (status == 'expire') return 'badge-danger'
      else return 'badge-success'
    }
  },
  mounted() {
    this.fetchMyBackerDetail()

    let production = {path: 'https://app.midtrans.com/snap/snap.js', client_key: 'Mid-client-EHtWk5mmvcuktJzc'};
    let sandbox = {path: 'https://app.sandbox.midtrans.com/snap/snap.js', client_key: 'SB-Mid-client-Ww7JEtCsPKpTmERy'};
    let midtransSnapScript = document.createElement('script')
    midtransSnapScript.setAttribute('src', config.is_production ? production.path : sandbox.path)
    midtransSnapScript.setAttribute('data-client-key', config.is_production ? production.client_key : sandbox.client_key)
    document.head.appendChild(midtransSnapScript)
  }
}
</script>

<style scoped>
.wrapper-detail {
  height: 100vh;
  background-color: white;
}
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
  font-size: 12px;
  line-height: 14px;
  color: #008FD7;
}
.backer-img {
  width: 130px;
  height: 75px;
  object-fit: contain;
}
.payment-method {
  font-weight: 700;
  font-size: 14px;
  line-height: 140%;
  text-decoration-line: underline;
  text-transform: capitalize;
  color: #5C5C70;
}
</style>
