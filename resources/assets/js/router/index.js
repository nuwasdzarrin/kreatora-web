import VueRouter from 'vue-router';
import Home from '../layouts/Home.vue';
import Login from '../pages/auths/Login.vue';
import Register from "../pages/auths/Register";
import Verification from "../pages/auths/Verification";
import Store from '../store';
import HomePage from "../pages/HomePage";
import CampaignDetail from "../pages/campaigns/CampaignDetail";
import CampaignReward from "../pages/campaigns/CampaignReward";
import CampaignSupport from "../pages/campaigns/CampaignSupport";
import MyBacker from "../pages/my_backers/MyBacker";
import MyBackerDetail from "../pages/my_backers/MyBackerDetail";
import Account from "../pages/users/Account";
import Detail from "../pages/users/Detail";

let routes = [
    {
        path: '/campaign',
        component: Home,
        meta: {requiresAuth: false},
        children: [
            {
                path: '/',
                component: HomePage,
                name: 'HomePage',
                meta: {requiresAuth: false},
            },
            {
                path: '/campaign/my_backer/detail',
                component: MyBackerDetail,
                name: 'MyBackerDetail',
                meta: {requiresAuth: false},
            },
            {
                path: '/campaign/login',
                name: "Login",
                component: Login,
                meta: {requiresAuth: false, is_guest: true},
            },
            {
                path: '/campaign/register',
                name: "Register",
                component: Register,
                meta: {requiresAuth: false},
            },
            {
                path: '/campaign/verification',
                name: "Verification",
                component: Verification,
                meta: {requiresAuth: false},
            },
            {
                path: '/campaign/:slug',
                component: CampaignDetail,
                name: 'CampaignDetail',
                meta: {requiresAuth: false},
            },
            {
                path: '/campaign/:slug/reward',
                component: CampaignReward,
                name: 'CampaignReward',
                meta: {requiresAuth: false},
            },
            {
                path: '/campaign/:slug/support',
                component: CampaignSupport,
                name: 'CampaignSupport',
                meta: {requiresAuth: false},
            },
        ]
    },
    {
        path: '/dashboard',
        name: 'Home',
        component: Home,
        meta: {requiresAuth: true},
        children: [
            {
                path: '/dashboard/account',
                component: Account,
                name: 'DashboardAccount',
            },
            {
                path: '/dashboard/account/detail',
                component: Detail,
                name: 'DashboardAccountDetail',
            },
            {
                path: '/dashboard/my_backer',
                component: MyBacker,
                name: 'DashboardMyBacker',
            },
        ],
    },
];

const router = new VueRouter({
    mode: 'history',
    base: '/',
    routes,
});

router.beforeEach((to, from, next) => {
    let is_guest = false
    if (to.matched.some(record => {
        is_guest = record.meta.is_guest
        return record.meta.requiresAuth
    })) {
        if (!Store.getters.isLoggedIn) {
            next({
                name: 'HomePage',
            });
        } else {
            next();
        }
    } else {
        if (is_guest && Store.getters.isLoggedIn) {
            next({
                name: 'HomePage',
            });
        }else{
            next();
        }
    }
});

export default router;
