<template>
  <div class="campaign-item-card">
    <img src="/assets_app/images/buku-anak.png" alt="img-campaign">
    <div class="p-2">
      <h6><strong>Buku mewarnai Edukasi ...</strong></h6>
      <div class="d-flex justify-content-between campaign-meta">
        <div>oleh : <span class="campaign-author">Simon Samin</span></div>
        <div>3 hari tersisa</div>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: "CampaignItem"
}
</script>

<style scoped>
.campaign-item-card {
  max-width: 256px;
  background: #FAFCFE;
  box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.12);
  border-radius: 12px;
  margin-right: 10px;
}
.campaign-meta {
 font-size: 12px;
}
.campaign-author {
  color: #008FD7;
}
</style>
