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
        google: '/api/auth/google',
        steam: '/api/auth/steam/register/{id}',
        email_verification: '/api/email_verification',
        resend_code: '/api/email_code',
        refresh_fcm_token: '/api/refresh_fcm_token',
    },
    backer: {
        base: '/api/my_backer',
        detail: '/api/my_backer/{id}',
    },
    campaign: {
        home: '/api/campaigns/home',
        base: '/api/campaigns',
        detail: '/api/campaigns/{id}',
        slug: '/api/campaigns/slug/{slug}',
        support: '/api/support',
    },
    campaign_category: {
        home: '/api/campaign_categories/home',
        base: '/api/campaign_categories',
        detail: '/api/campaign_categories/{id}',
        slug: '/api/campaign_categories/slug/{slug}',
    },
    comment: {
        base: '/api/campaign_comments'
    },
    customer: {
        base: '/api/customers',
        detail: '/api/customers/{id}'
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
