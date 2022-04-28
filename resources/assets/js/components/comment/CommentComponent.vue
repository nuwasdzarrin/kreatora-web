<template>
    <div>
        <div v-for="(item, index) in comments" :key="index">
            <div>
                <div class="d-flex align-item-center py-3">
                    <img :src="(item && item.user_avatar) ? (api.storage + item.user_avatar) : api.no_image" class="comment-avatar mr-2" alt="">
                    <div>
                        <h6 style="font-weight: 600;">{{item.user_name || 'Anonim'}}</h6>
                        <div>{{ daysLeft(item.created_at) }} days ago</div>
                    </div>
                </div>
                <div>{{item.content}}</div>
                <div class="d-flex mt-3">
                    <a href="javascript:void(0)" @click="replyTo(item)"><i class="fa fa-share fa-flip-horizontal mr-1"></i> Balas</a>
                    <div class="ml-4" style="font-weight: 400;" v-if="item.childs.length">{{ item.childs.length}} Balasan</div>
                </div>
            </div>
            <div class="ml-4 my-3" v-for="(child, i) in item.childs" :key="i">
                <div class="d-flex align-item-center py-3">
                    <img :src="(child && child.user_avatar) ? (api.storage + child.user_avatar) : api.no_image" class="comment-avatar mr-2" alt="">
                    <div>
                        <h6 style="font-weight: 600;">{{child.user_name || 'Anonim'}}</h6>
                        <div>{{ daysLeft(item.created_at) }} days ago</div>
                    </div>
                </div>
                <div>{{child.content}}</div>
                <!-- <div class="d-flex mt-3">
                    <div><i class="fa fa-share fa-flip-horizontal mr-1"></i> Balas</div>
                    <a href="#" class="ml-4" style="font-weight: 700;">5 Balasan</a>
                </div> -->
            </div>
            <hr>
        </div>
    </div>
</template>
<script>
import Apis from "../../apis"
export default {
    name: 'CommentComponent',
    props: {
        comments: {
            type: Array,
            default: function() {
                return [];
            }
        }
    },
    data: function () {
        return {
            api: Apis
        }
    },
    methods: {
        daysLeft(time) {
            let cal = moment().diff(moment(time), 'days')
            return cal > 0 ? cal : 0
        },
      replyTo(payload) {
          this.$emit('onReply', payload)
      }
    }
}
</script>
<style scoped>
.comment-avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
}
</style>
