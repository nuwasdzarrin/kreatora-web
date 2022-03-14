<template>
<div class="row my-4">
  <div class="col-8">
    <h5><strong>{{title}}</strong></h5>
  </div>
  <div class="col-4 text-right">
    <a href="javascript:void(0)" @click="onClickBack" v-show="clickBack">Kecilkan</a>
  </div>
  <div class="col-12 mt-2">
    <CampaignItem v-for="(item, index) in data" :key="index" :item="item" parent="CampaignVerticalList"></CampaignItem>
  </div>
</div>
</template>

<script>
import CampaignItem from "./CampaignItem";
export default {
  name: "CampaignVerticalList",
  components: {
    CampaignItem
  },
  props: {
    title: {
      type: String,
      default: "Title"
    },
    url: String,
    data: Array,
    clickBack: {
      type: Boolean,
      default: true
    }
  },
  methods: {
    onClickBack() {
      this.$emit('onClickBack', "")
    }
  }
}
</script>

<style scoped>

</style>
