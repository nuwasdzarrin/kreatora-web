<template>
<div class="row my-4">
  <div class="col-8">
    <h5><strong>{{title}}</strong></h5>
  </div>
  <div class="col-4 text-right">
    <a href="#">Lihat semua</a>
  </div>
  <div class="col-12 mt-2 d-flex overflow-auto" style="padding-bottom: 12px;">
    <CampaignItem v-for="(item, index) in data" :key="index" :item="item"></CampaignItem>
  </div>
</div>
</template>

<script>
import CampaignItem from "./CampaignItem";
export default {
  name: "CampaignHorizontalList",
  components: {
    CampaignItem
  },
  props: {
    title: {
      type: String,
      default: "Title"
    },
    url: String,
    data: Array
  }
}
</script>

<style scoped>

</style>
