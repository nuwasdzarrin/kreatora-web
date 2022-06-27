
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
import VueSocialSharing from 'vue-social-sharing'
import firebase from "firebase/app";
import "firebase/messaging";

window.Vue = require('vue');
Vue.use(VueRouter);
Vue.use(VueToastr, {
    /* OverWrite Plugin Options if you need */
});
Vue.use(VueSocialSharing);
window.Vue = require('vue');
window._ = require('lodash');
window.moment = require('moment');
window.events = new Vue();
Vue.prototype.window = window;

firebase.initializeApp({
    apiKey: "AIzaSyAi03PUUjCVEiOqYWBKeCfnC2dtC77oELA",
    authDomain: "kreatora-mobile.firebaseapp.com",
    projectId: "kreatora-mobile",
    storageBucket: "kreatora-mobile.appspot.com",
    messagingSenderId: "671989481166",
    appId: "1:671989481166:web:f16d956b7fbd452b62da9f"
});

// if ('serviceWorker' in navigator) {
//     window.addEventListener('load', function () {
//         navigator.serviceWorker
//             .register("firebase-messaging-sw.js")
//             .then((registration) => {
//                 const messaging = firebase.messaging();
//                 messaging.useServiceWorker(registration);
//             })
//             .catch((err) => {
//                 console.log(err);
//             });
//     });
// }
navigator.serviceWorker
    .register("firebase-messaging-sw.js")
    .then((registration) => {
        const messaging = firebase.messaging();
        messaging.useServiceWorker(registration);
    })
    .catch((err) => {
        console.log(err);
    });

Vue.filter('formatCurrency', function (value) {
    return Number(value).toLocaleString('id-ID');
});
Vue.filter('dateDDMMYYYY', function (date) {
    return moment(date).format('DD MMM YYYY')
})
Vue.filter('timeHHmm', function (date) {
    return moment(date).format('HH:mm')
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

Vue.component('layout', require('./layouts/Layout.vue'));
Vue.component('steam', require('./layouts/Steam.vue'));
Vue.component('home', require('./layouts/Home.vue'));
Vue.component('TopNavbar', require('./components/navbars/TopNavbar.vue'));
Vue.component('TopNavbarBlock', require('./components/navbars/TopNavbarBlock.vue'));
Vue.component('NoTopNavbar', require('./components/navbars/NoTopNavbar.vue'));
Vue.component('BottomNavbar', require('./components/navbars/BottomNavbar.vue'));
Vue.component('notification-list', require('./components/NotificationList.vue'));
Vue.component('notification', require('./components/Notification.vue'));
Vue.component('pagination', require('./components/Pagination.vue'));
Vue.component('autocomplete', require('./components/AutoComplete.vue'));

const app = new Vue({
    el: '#app',
    router,
    store: store,
});
