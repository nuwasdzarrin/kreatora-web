<template>
  <div class="row">
    <div class="col-12">
      <div class="d-flex justify-content-between align-items-center p-4 home-wallet-wrapper">
        <div>
          <div>Saldo Dompet Kreasi </div>
          <h4>Rp. 200.000</h4>
        </div>
        <div><i class="fas fa-wallet" style="font-size: 30px;"></i></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeWalletComponent"
}
</script>

<style scoped>
.home-wallet-wrapper {
  color: #FFFFFF;
  background: linear-gradient(180deg, #3FBFFF 0%, #008FD7 100%);
  box-shadow: 4px 4px 15px rgba(0, 0, 0, 0.12);
  border-radius: 14px;
}
</style>
