import VueRouter from 'vue-router';
import ItemCreate from '../components/items/Create.vue';
import ItemEdit from '../components/items/Edit.vue';
import Home from '../layouts/Home.vue';
import HomeWithoutAuth from "../layouts/HomeWithoutAuth";
import Product from '../components/Product.vue';
import ProductCreate from '../components/products/Create.vue';
import ProductEdit from '../components/products/Edit.vue';
import Transaction from '../components/Transaction.vue';
import TransactionEdit from '../components/transactions/Edit.vue';
import TransactionCreate from '../components/transactions/Create.vue';
import TransactionDetail from '../components/TransactionDetail.vue';
import ItemProduct from '../components/ItemProduct.vue';
import ItemProductEdit from '../components/item-products/Edit.vue';
import ItemProductCreate from '../components/item-products/Create.vue';
import CompanyCreate from '../pages/companies/Create';
import WaterMeter from '../pages/WaterMeter';
import WaterMeterCreate from '../pages/water-meters/Create';
import WaterMeterEdit from '../pages/water-meters/Edit';
import Customer from '../pages/Customer';
import CustomerCreate from '../pages/customers/Create';
import CustomerEdit from '../pages/customers/Edit';
import User from '../pages/User';
import UserCreate from '../pages/users/Create';
import UserEdit from '../pages/users/Edit';
import RateCategory from '../pages/RateCategory';
import RateCategoryCreate from '../pages/rate-categories/Create';
import RateCategoryEdit from '../pages/rate-categories/Edit';
import PriceSetting from '../pages/PriceSetting';
import PriceSettingCreate from '../pages/price-settings/Create';
import PriceSettingEdit from '../pages/price-settings/Edit';
import Billing from '../pages/Billing';
import Login from '../pages/auths/Login.vue';
import Store from '../store';
import Finance from '../pages/Finance';
import FinanceCreate from '../pages/finances/Create';
import FinanceEdit from '../pages/finances/Edit';
import HomePage from "../pages/HomePage";
import CampaignDetail from "../pages/campaigns/CampaignDetail";
import Account from "../pages/Account";

let routes = [
    {
        path: '/',
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
                path: '/campaign/:slug',
                component: CampaignDetail,
                name: 'CampaignDetail',
                meta: {requiresAuth: false},
            },
        ]
    },
    {
        path: '/',
        component: Home,
        meta: {requiresAuth: true},
        children: [
            {
                path: '/dashboard',
                component: HomePage,
                name: 'DashboardHomePage',
            },
            {
                path: 'dashboard/campaign/:slug',
                component: CampaignDetail,
                name: 'DashboardCampaignDetail',
            },
            {
                path: 'dashboard/account',
                component: Account,
                name: 'DashboardAccount',
            },
            {
                path: 'items/create',
                component: ItemCreate,
                name: 'item-create',
                meta: {requiresAuth: true},
            },
            {
                path: 'items/:id',
                component: ItemEdit,
                name: 'item-edit',
                meta: {requiresAuth: true},
                props: true,
            },
            {
                path: 'products',
                component: Product,
                name: 'product',
                meta: {requiresAuth: true},
            },
            {
                path: 'products/create',
                component: ProductCreate,
                name: 'product-create',
                meta: {requiresAuth: true},
            },
            {
                path: 'products/:id',
                component: ProductEdit,
                name: 'product-edit',
                meta: {requiresAuth: true},
                props: true,
            },
            {
                path: 'item-products',
                component: ItemProduct,
                name: 'item-product',
                meta: {requiresAuth: true},
            },
            {
                path: 'item-products/create',
                component: ItemProductCreate,
                name: 'item-product-create',
                meta: {requiresAuth: true},
                props: true,
            },
            {
                path: 'item-products/:id',
                component: ItemProductEdit,
                name: 'item-product-edit',
                meta: {requiresAuth: true},
                props: true,
            },
            {
                path: 'transactions',
                component: Transaction,
                name: 'transaction',
                meta: {requiresAuth: true},
            },
            {
                path: 'transactions/create',
                component: TransactionCreate,
                name: 'transaction-create',
                meta: {requiresAuth: true}
            },
            {
                path: 'transactions/:id/detail',
                component: TransactionDetail,
                name: 'transaction-details',
                meta: {requiresAuth: true},
                props: true,
            },
            {
                path: 'transactions/:id',
                component: TransactionEdit,
                name: 'transaction-edit',
                meta: {requiresAuth: true},
                props: true,
            },

            {
                path: 'water-meter',
                component: WaterMeter,
                name: 'water-meter',
                meta: {requiresAuth: true},
            },
            {
                path: 'water-meter/create',
                component: WaterMeterCreate,
                name: 'water-meter-create',
                meta: {requiresAuth: true},
            },
            {
                path: 'water-meter/:id',
                component: WaterMeterEdit,
                name: 'water-meter-edit',
                meta: {requiresAuth: true},
                props: true,
            },

            {
                path: 'customer',
                component: Customer,
                name: 'customer',
                meta: {requiresAuth: true},
            },
            {
                path: 'customer/create',
                component: CustomerCreate,
                name: 'customer-create',
                meta: {requiresAuth: true},
            },
            {
                path: 'customer/:id',
                component: CustomerEdit,
                name: 'customer-edit',
                meta: {requiresAuth: true},
                props: true,
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

            {
                path: 'rate-category',
                component: RateCategory,
                name: 'rate-category',
                meta: {requiresAuth: true},
            },
            {
                path: 'rate-category/create',
                component: RateCategoryCreate,
                name: 'rate-category-create',
                meta: {requiresAuth: true},
            },
            {
                path: 'rate-category/:id',
                component: RateCategoryEdit,
                name: 'rate-category-edit',
                meta: {requiresAuth: true},
                props: true,
            },

            {
                path: 'rate-category/:rate_category_id/price-setting',
                component: PriceSetting,
                name: 'price-setting',
                meta: {requiresAuth: true},
                props: true,
            },
            {
                path: 'rate-category/:rate_category_id/price-setting/create',
                component: PriceSettingCreate,
                name: 'price-setting-create',
                meta: {requiresAuth: true},
                props: true,
            },
            {
                path: 'rate-category/:rate_category_id/price-setting/:id',
                component: PriceSettingEdit,
                name: 'price-setting-edit',
                meta: {requiresAuth: true},
                props: true,
            },

            {
                path: 'billing',
                component: Billing,
                name: 'billing',
                meta: {requiresAuth: true},
            },

            {
                path: 'finance',
                component: Finance,
                name: 'finance',
                meta: {requiresAuth: true},
            },
            {
                path: 'finance/create',
                component: FinanceCreate,
                name: 'finance-create',
                meta: {requiresAuth: true},
            },
            {
                path: 'finance/:id',
                component: FinanceEdit,
                name: 'finance-edit',
                meta: {requiresAuth: true},
                props: true,
            },
        ],
    },
    {
        path: '/login',
        name: "Login",
        component: Login,
        meta: {requiresAuth: false},
    },
    {
        path: '/company/create',
        component: CompanyCreate,
        name: 'company-create',
        meta: {requiresAuth: true},
    },
];

const router = new VueRouter({
    routes
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
