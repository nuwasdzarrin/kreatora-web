<template>
<div class="row my-4">
  <div class="col-8">
    <h5><strong>{{title}}</strong></h5>
  </div>
  <div class="col-4 d-flex justify-content-end">
    <div class="campaign-list-dot mr-1" :class="{'dot-active': title === 'Semua'}">&nbsp;</div>
    <div class="campaign-list-dot mr-1" :class="{'dot-active': item.name === title}" v-for="(item, index) in categories" :key="index">&nbsp;</div>
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
    categories: Array,
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

<style lang="css" scoped>
.campaign-list-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: #C4C4C4;
}
.dot-active {
  background-color: #008FD7;
}
</style>
