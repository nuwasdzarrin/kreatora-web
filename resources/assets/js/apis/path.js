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
        detail: '/api/campaigns/{id}',
        slug: '/api/campaigns/{slug}',
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
