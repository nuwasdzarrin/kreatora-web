<template>
  <div class="support-wrapper">
    <div class="container bg-white" style="box-shadow: 0 2px 2px rgba(0, 0, 0, 0.15);">
      <div class="d-flex align-items-center py-3 text-14">
        <div @click="$router.push({ name: isLoggedIn ? 'DashboardCampaignReward':'CampaignReward', params: { slug: detail_campaign.title }})" style="cursor: pointer;">
          <i class="fas fa-arrow-left" style="color: #008FD7;font-size: 20px;"></i>
        </div>
        <div class="support-header ml-5">Dukung Kreasi</div>
      </div>
    </div>
    <div class="container mt-4">
      <div class="support-header mb-3">
        {{ reward_selected.title }}
      </div>
      <div class="mb-1">Judul Kreasi:</div>
      <div class="text-color-black mb-2"><b>{{ lodash.startCase(detail_campaign.title) }}</b></div>
      <div class="mb-1">Dukungan akan dikirimkan ke Kreator :</div>
      <div class="d-flex align-items-center mb-3">
        <img :src="(detail_campaign && detail_campaign.creator_avatar) ? api.storage + detail_campaign.creator_avatar : api.no_image" alt="avatar-creator" class="user-avatar mr-1">
        <strong class="text-color-black">{{lodash.startCase(detail_campaign.creator_name)}}</strong>
        <i class="fas fa-certificate ml-1" style="color: #008FD7;"></i>
      </div>
      <div class="card-support-content d-flex justify-content-between text-color-black mb-3">
        <div><b>Nilai Dukungan</b></div>
        <div v-if="reward_selected.min_donation > 0"><b>Rp {{ (reward_selected.min_donation || 0) | formatCurrency }}</b></div>
        <div style="max-width: 120px;" v-else>
          <my-currency-input ref="amountTmp" class="form-control support-tip-input" :class="is_empty_amount ? 'border-danger':''" v-model="amount_tmp" />
        </div>
      </div>
      <div class="card-support-content d-flex justify-content-between">
        <div>
          <div class="text-color-black mb-1"><b>Tip (opsional)</b></div>
          <div>Yuk beri tip kepada kreator agar mendukung semakin lancarnya projek ini </div>
        </div>
        <div class="d-flex align-items-center ml-2" style="max-width: 120px;">
          <my-currency-input class="form-control support-tip-input" v-model="form_data.tip" />
        </div>
      </div>
      <hr>
      <div class="card-support-content d-flex justify-content-between text-primary">
        <div><b>Total</b></div>
        <div><b>Rp {{ totalDonation | formatCurrency }}</b></div>
      </div>
      <hr>
      <div class="my-2">
        <div v-if="isLoggedIn">
          <div class="text-color-black mb-2 px-3" style="text-transform: uppercase;"><b>{{ form_data.name }}</b></div>
          <div class="mb-1 px-3">{{ form_data.email }}</div>
        </div>
        <div v-else>
          <div class="d-flex justify-content-between mt-4 mb-3">
            <div>
              <div class="text-color-black"><b>Ups! Kamu belum login</b></div>
              <div>Lengkapi data dibawah ini</div>
            </div>
            <div>
              <button class="btn btn-primary" @click="$router.push({name: 'Login'})">LOGIN</button>
            </div>
          </div>
          <div class="form-group">
            <input type="text" class="form-control support-identity" placeholder="Nama Lengkap" v-model="form_data.name">
          </div>
          <div class="form-group">
            <input type="text" class="form-control support-identity" placeholder="email" v-model="form_data.email">
          </div>
        </div>
        <div class="form-group d-flex justify-content-end mb-1">
          <div style="cursor: pointer;" @click="uncheck('anonymous')"><b>Sebagai anonim</b></div>
          <input type="radio" style="margin: 7px 0 0 5px;" value="anonymous" v-model="form_data.is_anonymous" @click="uncheck('anonymous')">
        </div>
      </div>
      <div>
        <div class="form-group">
          <div class="text-color-black"><b>Sampaikan Pesan (optional)</b></div>
          <div class="text-14 mb-2">Salurkan semangat pada kreator untuk mendukung kreasi ini sukses</div>
          <textarea class="form-control support-identity" style="height: 120px;" v-model="form_data.comment" />
        </div>
      </div>    
    </div>
    <div class="wrapper-btn-confirmation bg-white">
      <button class="btn btn-primary btn-block" @click="storeSupport">Konfirmasi</button>
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
import MyCurrencyInput from "../../components/core/MyCurrencyInput"
import lodash from "lodash"

export default {
  name: "CampaignSupport",
  components: {
    MyCurrencyInput
  },
  data() {
    return {
      lodash: lodash,
      api: Apis,
      is_loading: false,
      slug: this.$route.params.slug,
      detail_campaign: {},
      reward_selected: {},
      previouslySelected: 'anonymous',
      amount_tmp: 0,
      is_empty_amount: false,
      form_data: {
        campaign_id: null,
        reward_id: null,
        tip: 0,
        name: '',
        email: '',
        is_anonymous: false,
        comment: ''
      }
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
    totalDonation() {
      return this.form_data.tip + ((Object.keys(this.reward_selected).length && this.reward_selected.min_donation > 0) ? this.reward_selected.min_donation : this.amount_tmp)
    }
  },
  methods: {
    fetchProfile(){
      if (!this.isLoggedIn) return
      Apis.user.profile().then(({data}) => {
        this.$store.commit('SET_USER', data.data)
        this.$set(this.form_data, 'name', data.data.name)
        this.$set(this.form_data, 'email', data.data.email)
      }).catch((error) => {
        throw error
      })
    },
    fetchDetailCampaign() {
      this.$set(this, 'is_loading', true)
      Apis.campaign.slug(this.slug, {}).then(({data}) => {
        this.$set(this, 'detail_campaign', data)
        let reward_id_selected = (this.$route.query && this.$route.query.reward) || 0
        if (data.rewards.length) {
          let rewardSelected = lodash.filter( data.rewards, function(reward) {
            return reward_id_selected == reward.id
          })
          if (!rewardSelected.length) return this.$router.push({ name: 'CampaignReward', params: { slug: data.title }})
          this.$set(this, 'reward_selected', rewardSelected[0])
          this.$set(this.form_data, 'campaign_id', data.id)
          this.$set(this.form_data, 'reward_id', parseInt(reward_id_selected))
        } else return this.$router.push({ name: 'CampaignDetail', params: { slug: data.title }})
        this.$set(this, 'is_loading', false)
      }).catch((error) => {
        this.$set(this, 'is_loading', false)
        throw error
      })
    },
    uncheck(val) {
      if (val !== this.previouslySelected) {
        this.form_data.is_anonymous = false;
      }
      this.previouslySelected = this.form_data.is_anonymous
    },
    storeSupport() {
      let payload = {
        ...this.form_data,
        is_anonymous: !!this.form_data.is_anonymous,
        amount: this.reward_selected.min_donation ? this.reward_selected.min_donation : this.amount_tmp
      }
      if (payload.amount <= 0 ) {
        this.$set(this, 'is_empty_amount', true)
        this.$refs.amountTmp.$el.focus();
        return this.$toastr.e("Nilai dukungan wajib diisi");
      }
      this.$set(this, 'is_empty_amount', false)
      this.$set(this, 'is_loading', true)
      Apis.campaign.support(payload).then(({data}) => {
        this.$toastr.s("Dukungan telah tersimpan, silahkan lanjutkan pembayaran");
        this.$set(this, 'is_loading', false)
      }).catch((error) => {
        this.$set(this, 'is_loading', false)
        throw error
      })
    }
  },
  mounted() {
    this.fetchDetailCampaign()
    this.fetchProfile()
  }
}
</script>

<style scoped>
.support-wrapper {
  width: 100%;
  height: 100vh; 
  position: relative;
}
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
.user-avatar {
  width: 25px;
  height: 25px;
  border-radius: 50%;
}
.support-tip-input {
  border: 1px solid #5C5C70;
  box-sizing: border-box;
  border-radius: 12px;
  min-width: 100px;
  padding: 5px;
  text-align: right;
  font-weight: 700;
}
.support-identity {
  height: 55px;
  border: 1px solid #BDC1C3;
  border-radius: 12px;
}
.wrapper-btn-confirmation {
  /* width: 100%;
  position: absolute;
  bottom: 10px; */
  padding: 15px;
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
