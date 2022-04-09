import VueRouter from 'vue-router';
import Home from '../layouts/Home.vue';
import HomeWithoutAuth from "../layouts/HomeWithoutAuth";
import User from '../pages/User';
import UserCreate from '../pages/users/Create';
import UserEdit from '../pages/users/Edit';
import Login from '../pages/auths/Login.vue';
import Register from "../pages/auths/Register";
import Verification from "../pages/auths/Verification";
import Store from '../store';
import HomePage from "../pages/HomePage";
import CampaignDetail from "../pages/campaigns/CampaignDetail";
import CampaignReward from "../pages/campaigns/CampaignReward";
import CampaignSupport from "../pages/campaigns/CampaignSupport";
import Account from "../pages/Account";

let routes = [
    {
        path: '/campaign',
        name: HomeWithoutAuth,
        component: HomeWithoutAuth,
        meta: {requiresAuth: false},
        children: [
            {
                path: '/',
                component: HomePage,
                name: 'HomePage',
                meta: {requiresAuth: false},
            },
            {
                path: '/campaign/login',
                name: "Login",
                component: Login,
                meta: {requiresAuth: false},
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
        component: Home,
        meta: {requiresAuth: true},
        children: [
            {
                path: '/',
                component: HomePage,
                name: 'DashboardHomePage',
            },
            {
                path: '/dashboard/campaign/:slug',
                component: CampaignDetail,
                name: 'DashboardCampaignDetail',
            },
            {
                path: '/dashboard/account',
                component: Account,
                name: 'DashboardAccount',
            },
            {
                path: 'user',
                component: User,
                name: 'user',
                meta: {requiresAuth: true},
            },
            {
                path: 'user/create',
                component: UserCreate,
                name: 'user-create',
                meta: {requiresAuth: true},
            },
            {
                path: 'user/:id',
                component: UserEdit,
                name: 'user-edit',
                meta: {requiresAuth: true},
                props: true,
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
    if (to.matched.some(record => record.meta.requiresAuth)) {
        if (!Store.getters.isLoggedIn) {
            next({
                path: '/login',
            });
        } else {
            next();
        }
    } else {
        if (Store.getters.isLoggedIn) {
            next({
                path: '/dashboard',
            });
        }else{
            next();
        }
    }
});

export default router;
