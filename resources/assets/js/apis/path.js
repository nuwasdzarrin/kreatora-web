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
        google: '/api/auth/loginGoogle',
        email_verification: '/api/email_verification',
        resend_code: '/api/email_code',
    },
    campaign: {
        home: '/api/campaigns/home',
        base: '/api/campaigns',
        detail: '/api/campaigns/{id}',
        slug: '/api/campaigns/slug/{slug}',
    },
    campaign_category: {
        home: '/api/campaign_categories/home',
        base: '/api/campaign_categories',
        detail: '/api/campaign_categories/{id}',
        slug: '/api/campaign_categories/slug/{slug}',
    },
    customer: {
        base: '/api/customers',
        detail: '/api/customers/{id}'
    },
    measurement: {
        base: '/api/measurements',
        detail: '/api/measurements/{id}'
    },
    notification: {
        base: '/api/notifications'
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
