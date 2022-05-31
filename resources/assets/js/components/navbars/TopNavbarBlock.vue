<template>
  <div class="container bg-white" style="box-shadow: 0 2px 2px rgba(0, 0, 0, 0.15);">
    <div class="d-flex align-items-center py-3 text-14">
      <div @click="$router.push({ name: routes, params: params ? { slug: params.slug } : {}})"
           style="cursor: pointer;"
      >
        <i class="fas fa-arrow-left" style="color: #008FD7;font-size: 20px;"></i>
      </div>
      <div class="top-navbar-block-title ml-5">{{title}}</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "TopNavbarBlock",
  props: {
    title: String,
    params: {
      type: Object,
      default: function () {
        return {}
      }
    },
    routes: {
      type: String,
      default: 'HomePage'
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
  }
}
</script>

<style scoped>
.top-navbar-block-title {
  font-style: normal;
  font-weight: 700;
  font-size: 20px;
  line-height: 140%;
  color: #001B29;
}
</style>
