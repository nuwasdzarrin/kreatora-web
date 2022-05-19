<template>
  <div class="wrapper-backer">
    <TopNavbarBlock title="Dukungan Saya" :routes="{auth: `Dashboard${back_button}`, not_auth: back_button}" />
    <div class="container py-3">
      <div class="my-1" v-for="(item) in campaigns">
        <div class="py-2" @click="$router.push({
            name: isLoggedIn ? `Dashboard${detail_page}` : detail_page,
            query: { order_id: item.payment.order_id }
          })"
        >
          <div class="d-flex align-items-center justify-content-between">
            <div>
              <div class="title-backer my-2">{{item.campaign.title}}</div>
              <div class="label-backer my-2">{{item.created_at.date | dateDDMMYYYY}}&nbsp;&nbsp; - &nbsp;&nbsp;{{item.created_at.date | timeHHmm}} </div>
              <div class="label-backer my-2">Dukung&nbsp;&nbsp; -&nbsp;&nbsp; <span class="text-primary" style="font-weight: 700;">Success</span></div>
            </div>
            <div class="text-primary"><b>Rp {{ item.amount+item.tip | formatCurrency }}</b></div>
          </div>
        </div>
        <hr style="opacity: 0.4; border-top: 2px solid #001B29;"/>
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
import Apis from "../../apis";
import TopNavbarBlock from "../../components/navbars/TopNavbarBlock";
import lodash from "lodash";
export default {
  name: "MyBacker",
  components: {TopNavbarBlock},
  data: function () {
    return {
      is_loading: false,
      back_button: 'HomePage',
      detail_page: 'MyBackerDetail',
      campaigns: []
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
  },
  methods: {
    fetchMyBacker() {
      this.$set(this, 'is_loading', true)
      Apis.my_backer.index({}).then(({data}) => {
        this.$set(this, 'campaigns', data)
        this.$set(this, 'is_loading', false)
      }).catch((error) => {
        this.$set(this, 'is_loading', false)
        throw error
      })
    },
  },
  mounted() {
    this.fetchMyBacker()
  }
}
</script>

<style scoped>
.wrapper-backer {
  background-color: white;
  height: 100vh;
}
.title-backer {
  font-weight: 700;
  line-height: 140%;
  color: #001B29;
}
.label-backer {
  font-weight: 400;
  line-height: 14px;
  color: #5C5C70;
}
</style>
