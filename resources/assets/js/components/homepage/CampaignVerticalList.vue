<template>
<div class="row my-4">
  <div :class="categories.length ? 'col-8':'col-12'">
    <h5><strong>{{title}}</strong></h5>
  </div>
  <div class="col-4 d-flex justify-content-end align-items-center" v-if="categories.length && !isSearch">
    <div class="campaign-list-dot mr-1" :class="{'dot-active': title === 'Semua'}">&nbsp;</div>
    <div class="campaign-list-dot mr-1" :class="{'dot-active': item.name === title}" v-for="(item, index) in categories" :key="index">&nbsp;</div>
    <a href="javascript:void(0)" @click="onClickBack" v-show="clickBack">Kecilkan</a>
  </div>
  <div class="col-12 mt-4 text-center" v-if="isSearch && !data.length">
    <img src="/assets_app/images/search_not_found.png" alt="campaign not found" class="mb-2">
    <h6>Ups! Pencarian tidak ditemukan</h6>
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
    data: {
      type: Array,
      default: function() {
        return []
      }
    },
    categories: {
      type: Array,
      default: function() {
        return []
      }
    },
    clickBack: {
      type: Boolean,
      default: true
    },
    isSearch: {
      type: Boolean,
      default: false
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
