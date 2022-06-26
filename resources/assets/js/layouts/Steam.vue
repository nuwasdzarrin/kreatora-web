<template>
  <div class="master"></div>
</template>
<script>
import Cookie from "vue-cookie";

export default {
  name: "Steam",
  props: {
    steam: {
      type: Object,
      default: function () {
        return {}
      }
    }
  },
  created() {
    if (Object.keys(this.steam).length) {
      let data = this.steam.data
      Cookie.set('token', this.steam.token, {expires: '6h'});
      Cookie.set('user', JSON.stringify(data), { expires: '6h' });
      this.$store.commit('LOGIN_SUCCESS', data);
      if (data.email) {
        window.location.href = '/campaign'
      } else {
        window.location.href = '/campaign/register'
      }
    }
  }
}
</script>
