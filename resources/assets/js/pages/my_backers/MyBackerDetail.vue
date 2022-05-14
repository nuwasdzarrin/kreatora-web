<template>
  <div>
    <div>
      <TopNavbarBlock title="Dukung" :routes="{auth: `Dashboard${back_button}`, not_auth: back_button}" />
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
      back_button: 'MyCampaign',
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
.wrapper-detail {
  display: flex;
  flex-flow: column;
  height: 100vh;
  position: relative;
}
.detail-content {
  display: flex;
  flex-flow: column;
  flex: 1 1 auto;
}
.description-excerpt {
  border-radius: 20px 20px 0px 0px;
  flex: 1 1 auto;
}
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
.campaign-comments-length {
  position: absolute;
  right: -7px;
  top: -4px;
  font-size: 11px;
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
.comment-bottom-wrapper {
  width: 100%;
  position: absolute;
  bottom: 10px;
  left: 0;
  height: 80px;
  border-top: 1px solid;
}
.comment-send-button {
  box-sizing: border-box;
  width: 60px;
  height: 45px;
  border-radius: 5px;
  border: 1px solid #008FD7;
  color: #008FD7;
  cursor: pointer;
}
.comment-input {
  border: 1px solid #5C5C70;
  box-sizing: border-box;
  border-radius: 12px;
  min-width: 100px;
  height: 45px;
  padding: 5px;
}
</style>
