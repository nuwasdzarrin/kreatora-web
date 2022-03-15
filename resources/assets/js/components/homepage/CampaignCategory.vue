<template>
  <div class="d-flex pb-3" style="overflow-x: auto">
    <button class="button-category" :class="{'active': index === 0}" v-for="(item, index) in labels" :key="index">{{item}}</button>
  </div>
</template>

<script>
export default {
  name: "CampaignCategory",
  props: {
    labels: {
      type: Array,
      default: function () {
        return ['Semua']
      }
    }
  }
}
</script>

<style scoped>
.button-category {
  color: #FFFFFF;
  background-color: #5C5C70;
  opacity: 0.6;
  border-radius: 100px;
  border: unset;
  padding: 5px 15px;
  margin-right: 10px;
}
.active {
  opacity: unset;
  background-color: #008FD7;
}
</style>
