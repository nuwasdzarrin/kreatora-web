import Axios from 'axios';
import Path from './path';

// axios.defaults.baseURL = 'http://localhost:'+window.location.port+'/';

Axios.defaults.baseURL = '/';
Axios.defaults.headers.post['Content-Type'] = Path.header.content_type;
Axios.defaults.headers.post['Accept'] = Path.header.accept;

const api = {
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
        }
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
    },
    billing: {
        index: (params) => {
            return Axios.get(Path.billing.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.billing.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.billing.base, data);
        },
        update: (id,data) => {
            return Axios.put(Path.billing.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.billing.detail.replace('{id}', id))
        },
        print: (data) => {
            return Axios.post(Path.billing.print, data);
        },
    },
    company: {
        index: (params) => {
            return Axios.get(Path.company.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.company.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.company.base, data);
        },
        update: (id,data) => {
            return Axios.post(Path.company.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.company.detail.replace('{id}', id))
        },
        join: (data) => {
            return Axios.post(Path.company.join, data);
        },
    },
    customer: {
        index: (params) => {
            return Axios.get(Path.customer.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.customer.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.customer.base, data);
        },
        update: (id,data) => {
            return Axios.post(Path.customer.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.customer.detail.replace('{id}', id))
        }
    },
    finance: {
        index: (params) => {
            return Axios.get(Path.finance.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.finance.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.finance.base, data);
        },
        update: (id,data) => {
            return Axios.put(Path.finance.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.finance.detail.replace('{id}', id))
        }
    },
    measurement: {
        index: (params) => {
            return Axios.get(Path.measurement.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.measurement.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.measurement.base, data);
        },
        update: (id,data) => {
            return Axios.put(Path.measurement.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.measurement.detail.replace('{id}', id))
        }
    },
    notification: {
        index: (params) => {
            return Axios.get(Path.notification.base, {
                params: params
            });
        }
    },
    rate_category: {
        index: (params) => {
            return Axios.get(Path.rate_categories.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.rate_categories.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.rate_categories.base, data);
        },
        update: (id,data) => {
            return Axios.put(Path.rate_categories.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.rate_categories.detail.replace('{id}', id))
        }
    },
    price_setting: {
        index: (params) => {
            return Axios.get(Path.price_settings.base, {
                params: params
            });
        },
        show: (id, params) => {
            return Axios.get(Path.price_settings.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return Axios.post(Path.price_settings.base, data);
        },
        update: (id,data) => {
            return Axios.put(Path.price_settings.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return Axios.delete(Path.price_settings.detail.replace('{id}', id))
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
