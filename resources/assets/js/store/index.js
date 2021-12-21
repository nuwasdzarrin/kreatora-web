import Vuex from 'vuex';
import Vue from 'vue';
import jwt_decode from 'jwt-decode';
import Api from '../apis';
import Cookie from 'vue-cookie';

Vue.use(Vuex);

const LOGIN = "LOGIN";
const LOGIN_SUCCESS = "LOGIN_SUCCESS";
const LOGOUT = "LOGOUT";
const LOGIN_FAILED = "LOGIN_FAILED";
const SHOW_SUCCESS = "SHOW_SUCCESS";
const SET_NOTIF = "SET_NOTIF";
const ADD_NOTIF = "ADD_NOTIF";

const index = new Vuex.Store({
    state: {
        // isLoggedIn: !!localStorage.getItem("token"),
        isLoggedIn: !!Cookie.get('token'),
        isPending: false,
        isError : false,
        messages : "",
        isSuccess : false,
        user:{},
        notifications : []
    },
    mutations: {
        [LOGIN] (state) {
            state.isPending = true;
        },
        [LOGIN_SUCCESS] (state,user) {
            state.isLoggedIn = true;
            state.isPending = false;
            state.user = user;
        },
        [SET_NOTIF] (state,notifications) {
            state.notifications = notifications;
        },
        [ADD_NOTIF] (state,notification) {
            state.notifications.push(notification);
        },
        [LOGIN_FAILED] (state,message) {
            state.isPending = false;
            state.isError = true;
            state.messages = message;
        },
        [LOGOUT](state) {
            state.user = {};
            state.isLoggedIn = false;
        },
        [SHOW_SUCCESS](state,message) {
            state.isSuccess = true;
            state.messages = message;
        },
    },
    actions: {
        login({ commit }, creds) {
            commit(LOGIN);
            return new Promise(resolve => {
                Api.auth.login({
                    email: creds.email,
                    password: creds.password
                }).then(function (response) {
                    // localStorage.setItem("token", response.data.data.token);
                    // localStorage.setItem("myProfile", JSON.stringify(response.data.data.profile));
                    Cookie.set('token', response.data.data.token, { expires: '6h' });
                    Cookie.set('myProfile', JSON.stringify(response.data.data.profile), { expires: '6h' });
                    if(response.data.data.profile.companies.length) {
                        Cookie.set('companySelected', JSON.stringify(response.data.data.profile.companies[0]), { expires: '6h' });
                        // localStorage.setItem("companySelected", JSON.stringify(response.data.data.profile.companies[0]));
                    }
                    const decoded = jwt_decode(response.data.data.token);
                    commit(LOGIN_SUCCESS,decoded);
                    resolve();
                }).catch(function (error) {
                    var errorMsg = "";
                    if(error.response.status == 401){
                        errorMsg = error.response.data.error;
                    }else{
                        errorMsg = "Terjadi Kesalahan pada server.";
                    }
                    commit(LOGIN_FAILED,errorMsg);
                    resolve();
                });
            });
        },
        logout({ commit }) {
            Cookie.delete('token');
            Cookie.delete('myProfile');
            Cookie.delete('companySelected');
            // localStorage.removeItem("token");
            // localStorage.removeItem("myProfile");
            // localStorage.removeItem("companySelected");
            commit(LOGOUT);
        },
        success({ commit },message) {
            commit(SHOW_SUCCESS,message);
        },
        addNotif({ commit },notification) {
            commit(ADD_NOTIF,notification);
        },
        getNotification({ commit }) {
            return new Promise(resolve => {
                Api.notification.index({}).then(function (response) {
                    commit(SET_NOTIF,response.data);
                    resolve();
                }).catch(function (error) {
                    var errorMsg = "";
                    if(error.response.status == 401){
                        errorMsg = error.response.data.error;
                    }else{
                        errorMsg = "Terjadi Kesalahan pada server.";
                    }
                    resolve();
                });
            });
        }
    },
    getters: {
        isLoggedIn(state) {
            return state.isLoggedIn;
        },
        isPending(state) {
            return state.isPending;
        },
        isError(state) {
            return state.isError;
        },
        isSuccess(state) {
            return state.isSuccess;
        },
        messages(state){
            return state.messages;
        },
        getUid(state){
            return state.user.sub;
        },
        getNotifications(state){
            return state.notifications;
        }
    }
});

export default index;
