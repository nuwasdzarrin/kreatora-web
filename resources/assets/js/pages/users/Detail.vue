<template>
  <div class="account-wrapper">
    <TopNavbarBlock title="Detail Akun" routes="DashboardAccount"/>
    <div class="container">
      <div class="mt-4">
        <div class="d-flex justify-content-center mb-4">
          <div class="d-flex" style="position: relative;">
            <img :src="(profile && profile.image) ? profile.image : api.no_image"
                 alt="avatar image" class="avatar-image">
            <div class="d-flex align-items-center justify-content-center bg-primary pencil-wrapper"
                 @click="onEditAvatarClick">
              <i class="fa fa-pencil-alt text-white"></i>
            </div>
          </div>
        </div>
        <hr class="account-hr">
        <div class="px-3 py-1" v-if="is_edit">
          <form @submit.prevent="updateProfile">
            <div class="form-group">
              <label class="account-detail-title mb-0">Username</label>
              <input type="text" class="form-control" v-model="edit.name">
            </div>
            <div class="form-group">
              <label class="account-detail-title mb-0">Email Tertaut</label>
              <input type="email" class="form-control" v-model="edit.email">
            </div>
            <div class="form-group">
              <label class="account-detail-title mb-0">Password</label>
              <input type="password" class="form-control" v-model="edit.password">
              <small class="form-text text-muted">kosongkan jika tidak ingin mengganti password</small>
            </div>
            <div class="form-group">
              <label class="account-detail-title mb-0">Alamat</label>
              <textarea class="form-control" v-model="edit.address"></textarea>
            </div>
            <div class="form-group">
              <label class="account-detail-title mb-0">No. Ponsel</label>
              <input type="tel" class="form-control" v-model="edit.phone">
            </div>
            <div class="form-group">
              <label class="account-detail-title mb-0">Gender</label>
              <select class="form-control" v-model="edit.gender">
                <option value="male">Pria</option>
                <option value="female">Wanita</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
          </form>
        </div>
        <div class="px-3 py-1" v-else>
          <div class="d-flex justify-content-between my-3">
            <div>
              <div class="account-detail-title mb-1">Username</div>
              <div class="account-detail-subtitle mb-1">{{ profile.name }}</div>
            </div>
            <a href="javascript:void(0)" @click="onEditClick"><b>Edit</b></a>
          </div>
          <div class="my-3">
            <div class="account-detail-title mb-1">Email Tertaut</div>
            <div class="account-detail-subtitle mb-1">{{ profile.email }}</div>
          </div>
          <div class="my-3">
            <div class="account-detail-title mb-1">Password Akun</div>
            <div class="d-flex mb-1">
              <div class="password-dots"></div>
              <div class="password-dots"></div>
              <div class="password-dots"></div>
              <div class="password-dots"></div>
              <div class="password-dots"></div>
              <div class="password-dots"></div>
            </div>
          </div>
          <div class="my-3">
            <div class="account-detail-title mb-1">Alamat</div>
            <div class="account-detail-subtitle mb-1">{{ profile.address || '-' }}</div>
          </div>
          <div class="my-3">
            <div class="account-detail-title mb-1">No. Ponsel</div>
            <div class="account-detail-subtitle mb-1">{{ profile.phone || '-' }}</div>
          </div>
          <div class="my-3">
            <div class="account-detail-title mb-1">Gender</div>
            <div class="account-detail-subtitle mb-1">
              {{ (profile.gender === 'male' ? 'Pria' : 'Wanita') || '-' }}
            </div>
          </div>
        </div>
        <div class="spacer"></div>
<!--        <BottomNavbar />-->
      </div>
    </div>
    <div class="container kreatora-version">Kreatora v 0.0.4.128</div>
    <div class="modal fade" id="modalUpdateImage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-body">
            <div class="form-group">
              <label class="account-detail-title">Update avatar: </label>
              <div class="dropbox">
                <input type="file" @change="onAvatarChange"
                       accept="image/*" class="input-file" >
                <p>
                  Drag your image here to update<br> or click to browse
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <loading
        :active.sync="is_loading"
        :can-cancel="false"
        :is-full-page="true"
        color="#008FD7"
    ></loading>
  </div>
</template>

<script>
import Apis from "../../apis";
import TopNavbarBlock from "../../components/navbars/TopNavbarBlock";
import imageCompression from 'browser-image-compression'
export default {
  name: "AccountDetail",
  components: {TopNavbarBlock},
  data() {
    return {
      api: Apis,
      is_loading: false,
      is_edit: false,
      profile: {},
      edit: {}
    }
  },
  methods: {
    fetchProfile() {
      if (!this.isLoggedIn) return
      this.is_loading= true
      Apis.user.profile().then(({data}) => {
        this.$set(this, 'profile', data.data);
      }).catch((error) => {
        throw error
      }).finally(()=> this.is_loading=false)
    },
    updateProfile() {
      if (!this.isLoggedIn) return
      this.is_loading= true
      Apis.user.update(this.profile.id, this.edit).then(({data}) => {
        this.$set(this, 'profile', data.data);
      }).catch((error) => {
        throw error
      }).finally(()=> {
        this.is_loading = false
        this.is_edit= false
      })
    },
    onEditClick() {
      this.is_edit= true
      if (this.profile.name) this.edit.name = this.profile.name
      if (this.profile.email) this.edit.email = this.profile.email
      if (this.profile.address) this.edit.address = this.profile.address
      if (this.profile.phone) this.edit.phone = this.profile.phone
      if (this.profile.gender) this.edit.gender = this.profile.gender
    },
    onEditAvatarClick() {
      $('#modalUpdateImage').modal('show')
    },
    toBase64(file) {
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = error => reject(error);
      })
    },
    onAvatarChange(e) {
      let vm = this
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length)
        return;
      let origin_file = files[0];
      const options = {
        maxSizeMB: 1,
        maxWidthOrHeight: 600,
        useWebWorker: true
      }
      imageCompression(origin_file, options).then(function (compressedFile) {
        let new_file = new File([compressedFile], origin_file['name'], {
          type: origin_file['type']
        })
        vm.toBase64(new_file).then(res => {
          vm.edit.avatar = res
          $('#modalUpdateImage').modal('hide')
          vm.updateProfile()
        })
      }).catch(function (error) {
        throw error.message
      });
    },
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
  },
  mounted() {
    this.fetchProfile()
  }
}
</script>

<style scoped>
.account-wrapper {
  position: relative;
  height: 100vh;
  background-color: #FAFCFE;
}
.spacer {
  height: 50px;
}
.avatar-image {
  width: 100px;
  height: 100px;
  border-radius: 50%;
}
.pencil-wrapper {
  background: linear-gradient(180deg, #008FD7 0%, #0024D7 100%);
  width: 30px;
  height: 30px;
  border-radius: 50%;
  position: absolute;
  bottom: 0;
  right: 0;
  cursor: pointer;
}
.account-hr {
  opacity: 0.4;
  height:1px;
  border-width:0;
  background-color:#23232E
}
.account-detail-title {
  font-weight: 700;
  font-size: 16px;
  line-height: 140%;
  color: #001B29;
}
.account-detail-subtitle {
  font-weight: 400;
  font-size: 12px;
  line-height: 16px;
  color: #5C5C70;
}
.password-dots {
  width: 12px;
  height: 12px;
  margin: 0 3px;
  border-radius: 50%;
  background-color: #5C5C70;
}
.kreatora-version {
  font-weight: 400;
  font-size: 10px;
  line-height: 14px;
  color: #000000;
  opacity: 0.25;

  position: absolute;
  left: 0;
  bottom: 10px;
}
</style>
