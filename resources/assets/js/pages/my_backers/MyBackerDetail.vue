<template>
  <div>
    <div class="wrapper-detail">
      <TopNavbarBlock title="Detail Dukung" :routes="{auth: `Dashboard${back_button}`, not_auth: back_button}" />
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
          <tr>
            <td>Status</td>
            <td>: <span class="badge badge-pill badge-success">{{ detail.payment ? detail.payment.status || 'Pending' : 'Menunggu' }}</span></td>
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
      order_id: this.$route.query.order_id,
      detail: {}
    }
  },
  methods: {
    fetchMyBackerDetail() {
      this.$set(this, 'is_loading', true)
      Apis.my_backer.show(this.order_id).then(({data}) => {
        this.$set(this, 'is_loading', false)
        this.$set(this, 'detail', data)
      }).catch((error) => {
        this.$set(this, 'is_loading', false)
        throw error
      })
    }
  },
  mounted() {
    this.fetchMyBackerDetail()
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
</style>
