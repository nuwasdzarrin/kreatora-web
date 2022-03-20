<template>
	<div class="wrapper-mobile">
    <router-view></router-view>
<!--		<aside class="control-sidebar control-sidebar-dark"></aside>-->
	</div>
</template>

<script>
export default {
name: "HomeWithoutAuth"
}
</script>
<style>
.wrapper-mobile {
  max-width: 480px;
  background-color: #ECF1F4;
  margin: 0 auto;
  height: 100vh;
}
</style>
