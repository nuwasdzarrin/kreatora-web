<template>
	<div class="wrapper-mobile">
    <router-view></router-view>

<!--		<aside class="control-sidebar control-sidebar-dark"></aside>-->
	</div>
</template>

<script>
import axios from 'axios';
import Cookie from 'vue-cookie';
export default {
  name: 'Home',
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn
    }
  },
	created () {
    let vm = this
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
				if (err.response.status === 401 && err.config) {
          vm.$store.dispatch('logout');
				}
				throw err
			});
		});
	},
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
