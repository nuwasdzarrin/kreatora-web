<template>
<div class="mt-4">
  <NotLoginComponent />
  <CampaignHorizontalList title="Trending" />
  <CampaignHorizontalList title="Akan Berakhir" />
  <CampaignHorizontalList title="Populer" />
  <CampaignHorizontalList title="Terbaru" />
  <div class="spacer"></div>
  <BottomNavbar />
</div>
</template>

<script>
import NotLoginComponent from "../components/alerts/NotLoginComponent";
import CampaignHorizontalList from "../components/homepage/CampaignHorizontalList";
export default {
  name: "HomePage",
  components: {
    CampaignHorizontalList,
    NotLoginComponent
  }
}
</script>

<style scoped>
.spacer {
  height: 50px;
}
</style>
