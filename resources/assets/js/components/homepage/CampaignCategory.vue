<template>
  <div class="d-flex pt-2 category-scroll-x">
    <button class="button-category" :class="{'active': isActive === null}" @click="categoryClick(null)">Semua</button>
    <button class="button-category" :class="{'active': (isActive && item.id === isActive.id)}" v-for="(item, index) in originData" :key="index" @click="categoryClick(item)">{{item.name}}</button>
  </div>
</template>

<script>
export default {
  name: "CampaignCategory",
  props: {
    originData: {
      type: Array,
      default: function () {
        return [{
          id: 0,
          name: 'Semua'
        }]
      }
    }
  },
  data: function () {
    return {
      isActive: null
    }
  },
  methods: {
    categoryClick(item) {
      this.$set(this, 'isActive', item);
      this.$emit('onCategoryClick', item)
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
.category-scroll-x {
  overflow-x: auto;
  -ms-overflow-style: none;  /* IE and Edge */
  scrollbar-width: none;  /* Firefox */
}
.category-scroll-x::-webkit-scrollbar {
  display: none;
}

</style>
