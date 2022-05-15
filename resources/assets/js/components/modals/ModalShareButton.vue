<template>
    <div class="modal fade" id="idModalShareButton" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Bagikan ke</h5>
                    <button type="button" class="close" @click="hideModal">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="social-share-wrapper">
                    <ShareNetwork
                        v-for="network in networks"
                        :network="network.network"
                        :key="network.network"
                        :style="{backgroundColor: network.color}"
                        :url="sharing.url"
                        :title="sharing.title"
                        :description="sharing.description"
                        :quote="sharing.quote"
                        :hashtags="sharing.hashtags"
                        :twitterUser="sharing.twitterUser"
                    >
                        <i :class="network.icon"></i>
                        <span>{{ network.name }}</span>
                    </ShareNetwork>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        active: Boolean,
        originData: {
            type: Object,
            default: function() {
                return {};
            }
        }
    },
    data () {
        return {
            sharing: {
                url: window.location.origin,
                title: '',
                description: '',
                quote: 'The hot reload is so fast it\'s near instant. - Evan You',
                hashtags: 'vuejs,vite,javascript',
                twitterUser: 'kreatoraid'
            },
            networks: [
                { network: 'facebook', name: 'Facebook', icon: 'fab fah fa-lg fa-facebook-f', color: '#1877f2' },
                { network: 'line', name: 'Line', icon: 'fab fah fa-lg fa-line', color: '#00c300' },
                { network: 'linkedin', name: 'LinkedIn', icon: 'fab fah fa-lg fa-linkedin', color: '#007bb5' },
                { network: 'telegram', name: 'Telegram', icon: 'fab fah fa-lg fa-telegram-plane', color: '#0088cc' },
                { network: 'twitter', name: 'Twitter', icon: 'fab fah fa-lg fa-twitter', color: '#1da1f2' },
                { network: 'whatsapp', name: 'Whatsapp', icon: 'fab fah fa-lg fa-whatsapp', color: '#25d366' },

                // { network: 'baidu', name: 'Baidu', icon: 'fas fah fa-lg fa-paw', color: '#2529d8' },
                // { network: 'buffer', name: 'Buffer', icon: 'fab fah fa-lg fa-buffer', color: '#323b43' },
                // { network: 'email', name: 'Email', icon: 'far fah fa-lg fa-envelope', color: '#333333' },
                // { network: 'evernote', name: 'Evernote', icon: 'fab fah fa-lg fa-evernote', color: '#2dbe60' },
                // { network: 'flipboard', name: 'Flipboard', icon: 'fab fah fa-lg fa-flipboard', color: '#e12828' },
                // { network: 'hackernews', name: 'HackerNews', icon: 'fab fah fa-lg fa-hacker-news', color: '#ff4000' },
                // { network: 'instapaper', name: 'Instapaper', icon: 'fas fah fa-lg fa-italic', color: '#428bca' },
                // { network: 'messenger', name: 'Messenger', icon: 'fab fah fa-lg fa-facebook-messenger', color: '#0084ff' },
                // { network: 'odnoklassniki', name: 'Odnoklassniki', icon: 'fab fah fa-lg fa-odnoklassniki', color: '#ed812b' },
                // { network: 'pinterest', name: 'Pinterest', icon: 'fab fah fa-lg fa-pinterest', color: '#bd081c' },
                // { network: 'pocket', name: 'Pocket', icon: 'fab fah fa-lg fa-get-pocket', color: '#ef4056' },
                // { network: 'quora', name: 'Quora', icon: 'fab fah fa-lg fa-quora', color: '#a82400' },
                // { network: 'reddit', name: 'Reddit', icon: 'fab fah fa-lg fa-reddit-alien', color: '#ff4500' },
                // { network: 'skype', name: 'Skype', icon: 'fab fah fa-lg fa-skype', color: '#00aff0' },
                // { network: 'sms', name: 'SMS', icon: 'far fah fa-lg fa-comment-dots', color: '#333333' },
                // { network: 'stumbleupon', name: 'StumbleUpon', icon: 'fab fah fa-lg fa-stumbleupon', color: '#eb4924' },
                // { network: 'tumblr', name: 'Tumblr', icon: 'fab fah fa-lg fa-tumblr', color: '#35465c' },
                // { network: 'viber', name: 'Viber', icon: 'fab fah fa-lg fa-viber', color: '#59267c' },
                // { network: 'vk', name: 'Vk', icon: 'fab fah fa-lg fa-vk', color: '#4a76a8' },
                // { network: 'weibo', name: 'Weibo', icon: 'fab fah fa-lg fa-weibo', color: '#e9152d' },
                // { network: 'wordpress', name: 'Wordpress', icon: 'fab fah fa-lg fa-wordpress', color: '#21759b' },
                // { network: 'xing', name: 'Xing', icon: 'fab fah fa-lg fa-xing', color: '#026466' },
                // { network: 'yammer', name: 'Yammer', icon: 'fab fah fa-lg fa-yammer', color: '#0072c6' }
            ]
        }
    },
    watch: {
        'active': function(n,o) {
            if(n!==o) {
                n ? this.showModal() : this.hideModal();
            }
        },
        'originData': function(n) {
            this.sharing.title = n.title;
            this.sharing.description = n.short_desc;
            this.sharing.url = n.shareable_link;
        }
    },
    methods: {
        showModal: function() {
            $('#idModalShareButton').modal('show');
            this.$emit('update:active', true);
        },
        hideModal: function() {
            $('#idModalShareButton').modal('hide');
            this.$emit('update:active', false);
        },
    },
    mounted() {
    }
}
</script>
<style lang="css" scoped>
.social-share-wrapper {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    max-width: 1000px;
    margin: auto;
}
.social-share-wrapper a[class^="share-network-"] {
    flex: none;
    color: #FFFFFF;
    background-color: #333;
    border-radius: 3px;
    overflow: hidden;
    display: flex;
    flex-direction: row;
    align-content: center;
    align-items: center;
    cursor: pointer;
    margin: 0 10px 10px 0;
    padding: 5px 10px;
    text-decoration: none;
}
.social-share-wrapper a[class^="share-network-"] span {
    margin-left: 5px;
}
</style>
