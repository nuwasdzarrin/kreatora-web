<template>
	<div class="wrapper">
		<navbar></navbar>
		<sidebar></sidebar>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<router-view></router-view>
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
</template>

<script>
import axios from 'axios';
import Cookie from 'vue-cookie';
export default {
	created () {
		axios.interceptors.request.use(
				(config) => {
					// let token = localStorage.getItem("token");
					let token = Cookie.get('token');
					if (token) {
						config.headers['Authorization'] = 'Bearer ' + token
					}
					return config
				},
				(error) => {
					return Promise.reject(error)
				}
		);
		axios.interceptors.response.use(undefined, function (err) {
			return new Promise(function (resolve, reject) {
				if (err.status === 401 && err.config && !err.config.__isRetryRequest) {
					this.$store.dispatch('logout');
					this.$router.push({name: 'login'})
				}
				throw err
			});
		});
	}
}
</script>
