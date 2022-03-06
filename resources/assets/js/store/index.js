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
        login({ commit }, payload) {
            commit(LOGIN);
            return new Promise(resolve => {
                Api.auth.login({
                    email: payload.email,
                    password: payload.password
                }).then(function (response) {
                    Cookie.set('token', response.data.token, { expires: '6h' });
                    Cookie.set('user', JSON.stringify(response.data.data), { expires: '6h' });
                    commit(LOGIN_SUCCESS,response.data.data);
                    resolve(response.data.data);
                }).catch(function (error) {
                    var errorMsg = "";
                    if(error.response.status == 401){
                        errorMsg = error.response.data.error;
                    }else{
                        errorMsg = "Terjadi Kesalahan pada server.";
                    }
                    console.log(errorMsg)
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
        },
        authUser(state){
            return state.user
        }
    }
});

export default index;
