import Axios from 'axios';
import Path from './path';

// axios.defaults.baseURL = 'http://localhost:'+window.location.port+'/';

Axios.defaults.baseURL = '/';
Axios.defaults.headers.post['Content-Type'] = Path.header.content_type;
Axios.defaults.headers.post['Accept'] = Path.header.accept;

const api = {
    storage: '/assets/images/',
    no_image: '/assets_homepage/img/no-image.jpg',
    auth: {
        login: (data) => {
            return Axios.post(Path.auth.login, data);
        },
        logout: () => {
            return Axios.get(Path.auth.logout)
        },
        register: (data) => {
            return Axios.post(Path.auth.register, data)
        },
        facebook: () => {
            return Axios.get(Path.auth.facebook)
        },
        google: (user) => {
            return Axios.post(Path.auth.google, user, {params: {}})
        },
        resend_code: (data) => {
            return Axios.post(Path.auth.resend_code, data);
        },
        email_verification: (data) => {
            return Axios.post(Path.auth.email_verification, data);
        },
        refresh_fcm_token: (data) => {
            return Axios.post(Path.auth.refresh_fcm_token, data);
        },
    },
    campaign: {
        home: (params) => {
            return Axios.get(Path.campaign.home, {
                params: params
            });
        },
        index: (params) => {
            return Axios.get(Path.campaign.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.campaign.detail.replace('{id}', id), {
                params: params
            });
        },
        slug: (slug, params) => {
            return Axios.get(Path.campaign.slug.replace('{slug}', slug), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.campaign.base, data);
        },
        update: (id,data) => {
            return Axios.put(Path.campaign.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.campaign.detail.replace('{id}', id))
        },
        support: (data) => {
            return Axios.post(Path.campaign.support, data);
        },
    },
    my_backer: {
        index: (params) => {
            return Axios.get(Path.backer.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.backer.detail.replace('{id}', id), {
                params: params
            });
        },
    },
    campaign_category: {
        home: (params) => {
            return Axios.get(Path.campaign_category.home, {
                params: params
            });
        },
        index: (params) => {
            return Axios.get(Path.campaign_category.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.campaign_category.detail.replace('{id}', id), {
                params: params
            });
        },
        slug: (slug, params) => {
            return Axios.get(Path.campaign_category.slug.replace('{slug}', slug), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.campaign_category.base, data);
        },
        update: (id,data) => {
            return Axios.put(Path.campaign_category.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.campaign_category.detail.replace('{id}', id))
        },
    },
    comment: {
        store: (data) => {
            return Axios.post(Path.comment.base, data);
        },
    },
    notification: {
        index: (params) => {
            return Axios.get(Path.notification.base, {
                params: params
            });
        }
    },
    user: {
        index: (params) => {
            return Axios.get(Path.user.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.user.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.user.base, data);
        },
        update: (id,data) => {
            return Axios.put(Path.user.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.user.detail.replace('{id}', id))
        },
        profile: (params) => {
            return Axios.get(Path.user.profile, {
                params: params
            });
        },
        detailElse: (user) => {
            return Axios.get(Path.user.memberElse.replace('{username}', user))
        },
        editProfile: (data) => {
            return Axios.put(Path.user.member, data)
        },
        editAvatar: (image) => {
            return Axios.post(Path.user.avatar, image)
        }
    }
};

export default api;
