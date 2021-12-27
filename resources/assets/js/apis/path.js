const path = {
    base: '/api',
    header: {
        content_type: 'application/json',
        accept: 'application/json'
    },
    auth: {
        login: '/api/login',
        logout: '/api/logout',
        register: '/api/register',
        facebook: '/auth/',
        google: '/api/auth/loginGoogle'
    },
    campaign: {
        home: '/api/campaigns/home',
        base: '/api/campaigns',
        detail: '/api/billings/{id}',
    },
    billing: {
        base: '/api/billings',
        detail: '/api/billings/{id}',
        print: '/api/print_billings',
    },
    company: {
        base: '/api/companies',
        detail: '/api/companies/{id}',
        join: '/api/companies/join'
    },
    customer: {
        base: '/api/customers',
        detail: '/api/customers/{id}'
    },
    finance: {
        base: '/api/finances',
        detail: '/api/finances/{id}'
    },
    measurement: {
        base: '/api/measurements',
        detail: '/api/measurements/{id}'
    },
    notification: {
        base: '/api/notifications'
    },
    rate_categories: {
        base: '/api/rate_categories',
        detail: '/api/rate_categories/{id}'
    },
    price_settings: {
        base: '/api/price_settings',
        detail: '/api/price_settings/{id}'
    },
    user: {
        base: '/api/users',
        detail: '/api/users/{id}',
        profile: '/api/profile',
        memberElse: '/api/users/profile/{username}',
        avatar: '/api/users/profile/member/updatePhotoProfile'
    }
};

export default path;
