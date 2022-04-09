<template>
  <div style="height: 100vh; position: relative;">
    <div class="container bg-white" style="box-shadow: 0 2px 2px rgba(0, 0, 0, 0.15);">
      <div class="d-flex align-items-center py-3 text-14">
        <div @click="$router.push({ name: 'CampaignDetail', params: { slug: detail_campaign.title }})">
          <i class="fas fa-arrow-left" style="color: #008FD7;font-size: 20px;"></i>
        </div>
        <div class="support-header ml-5">Dukung Kreasi</div>
      </div>
    </div>
    <div class="container mt-4 pb-4">
      <div class="support-header mb-3">
        Dukung = Hadiah Stiker
      </div>
      <div class="mb-1">Judul Kreasi:</div>
      <div class="text-color-black mb-2"><b>Game Dadu Mengasah Otak</b></div>
      <div class="mb-1">Dukungan akan dikirimkan ke Kreator :</div>
      <div class="d-flex mb-3">
        <b class="text-color-black">Simon Samin </b>
      </div>
      <div class="card-support-content d-flex justify-content-between text-color-black mb-3">
        <div><b>Nilai Dukungan</b></div>
        <div><b>Rp 50.000</b></div>
      </div>
      <div class="card-support-content d-flex justify-content-between">
        <div>
          <div class="text-color-black mb-1"><b>Tip (opsional)</b></div>
          <div>Yuk beri tip kepada kreator agar mendukung semakin lancarnya projek ini </div>
        </div>
        <div><b>Rp 50.000</b></div>
      </div>
      <hr>
      <div class="card-support-content d-flex justify-content-between text-primary">
        <div><b>Total</b></div>
        <div><b>Rp 55.000</b></div>
      </div>
      <hr>
      <div class="my-3">
        <div class="d-flex justify-content-between mt-4 mb-3">
          <div>
            <div class="text-color-black"><b>Ups! Kamu belum login</b></div>
            <div>Lengkapi data dibawah ini</div>
          </div>
          <div>
            <button class="btn btn-primary">LOGIN</button>
          </div>
        </div>
        <div class="form-group">
          <input type="text" class="form-control support-identity" placeholder="Nama Lengkap">
        </div>
        <div class="form-group">
          <input type="text" class="form-control support-identity" placeholder="Nomor Telepon atau email">
        </div>
        <div class="form-group d-flex justify-content-end">
          <b>Sebagai anonim</b>
          <input type="radio" style="margin: 7px 0 0 5px;">
        </div>
      </div>
      <div class="bg-white" style="padding: 15px;">
        <button class="btn btn-primary btn-block">Konfirmasi</button>
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
  computed: {
  
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
.support-header {
  font-style: normal;
  font-weight: 700;
  font-size: 20px;
  line-height: 140%;
  color: #001B29;
}
.card-support-content {
  padding: 20px 15px;
  background-color: #FFFFFF;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.15);
  border-radius: 12px;
}
.support-identity {
  height: 55px;
  border: 1px solid #BDC1C3;
  border-radius: 12px;
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
