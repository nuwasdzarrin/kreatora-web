<template>
  <div>
    <TopNavbarBlock title="Dukungan Saya" :routes="{auth: `Dashboard${back_button}`, not_auth: back_button}" />
    <div class="container py-3">
      <div class="card my-3" v-for="(item) in campaigns">
        <div class="card-body" @click="$router.push({
            name: isLoggedIn ? `Dashboard${detail_page}` : detail_page,
            params: { slug: item.payment.order_id }
          })"
        >
          <h6>{{item.campaign.title}}</h6>
          <div>{{item.created_at.date | dateDDMMYYYY}} <b>Rp {{ item.amount+item.tip | formatCurrency }}</b></div>
          <div><span class="badge badge-pill badge-success">Success</span></div>
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

</style>
