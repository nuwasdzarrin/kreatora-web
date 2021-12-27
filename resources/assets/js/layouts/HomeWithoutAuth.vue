<template>
	<div class="wrapper-mobile">
		<TopNavbar></TopNavbar>

    <div class="container">
      <router-view></router-view>
    </div>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
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
}
</style>
