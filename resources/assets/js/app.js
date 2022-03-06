
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

import VueRouter from 'vue-router';
import router from './router';
import store from './store';
import 'vue-loading-overlay/dist/vue-loading.css';
import VueToastr from "vue-toastr";

window.Vue = require('vue');
Vue.use(VueRouter);
Vue.use(VueToastr, {
    /* OverWrite Plugin Options if you need */
});
window.Vue = require('vue');
window._ = require('lodash');
window.moment = require('moment');
window.events = new Vue();
Vue.prototype.window = window;
Vue.filter('formatCurrency', function (value) {
    return Number(value).toLocaleString('id-ID');
});
Vue.filter('dateDDMMYYYY', function (date) {
    return moment(date).format('DD MMM YYYY')
})
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('image-form', require('./components/ImageForm'));
Vue.component('loading', require('vue-loading-overlay'));
Vue.component('my-vue-select', require('./components/MyVueSelect'));
Vue.component('my-date-picker', require('./components/MyDatePicker'));
Vue.component('my-company-select', require('./components/MyCompanySelect'));

Vue.component('layout', require('./layouts/Layout.vue'));
Vue.component('home', require('./layouts/Home.vue'));
Vue.component('TopNavbar', require('./components/navbars/TopNavbar.vue'));
Vue.component('BottomNavbar', require('./components/navbars/BottomNavbar.vue'));
Vue.component('login', require('./pages/auths/Login.vue'));
Vue.component('notification-list', require('./components/NotificationList.vue'));
Vue.component('notification', require('./components/Notification.vue'));
Vue.component('pagination', require('./components/Pagination.vue'));
Vue.component('item-option', require('./components/items/ItemOption.vue'));
Vue.component('detail-form', require('./components/transactions/DetailForm.vue'));
Vue.component('autocomplete', require('./components/AutoComplete.vue'));

const app = new Vue({
    el: '#app',
    router,
    store: store,
});
