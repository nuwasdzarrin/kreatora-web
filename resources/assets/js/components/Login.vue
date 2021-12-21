<template>
  <div class="sign-in-body" >
    <div class="text-center" style="margin:auto">
        <div class="card mt-4" style="width: 350px">
            <div class="card-body">
                <form v-if="isLogin" class="form-signin" @submit.prevent="login()" >
                    <h1 class="h3 mb-3 font-weight-normal">Login dulu disini</h1>
                    <div v-if="isError" class="alert alert-danger">
                        <strong>Danger!</strong> {{messages}}
                    </div>
                    <div v-if="isRegisterAlert" class="alert alert-success">
                        <strong>Berhasil!</strong> {{registerMessage}}
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="sr-only">Alamat Email</label>
                        <input type="email" v-model="email" id="inputEmail" class="form-control" placeholder="alamat email" autocomplete="username" required>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="sr-only">Kata Sandi</label>
                        <input type="password" v-model="password" id="inputPassword" class="form-control" placeholder="kata sandi" autocomplete="current-password" required>
                    </div>
                    <p style="text-align: right;"><a href="/password/reset">Lupa kata sandi?</a></p>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" :disabled="isPending"><i v-if="isPending" class="fa fa-login fa-refresh fa-spin"></i>Masuk</button>
                    <p style="margin-top:10px;">Belum punya akun: <a @click.prevent="isLogin=false" style="text-decoration: underline;color: #007bff;cursor: pointer;">Daftar disini</a></p>
                </form>

                <form v-if="!isLogin" class="form-signin" @submit.prevent="doRegister()" >
                    <h1 class="h3 mb-3 font-weight-normal">Buat akun kamu disini</h1>
<!--                    <div v-if="isError" class="alert alert-danger">-->
<!--                        <strong>Danger!</strong> {{messages}}-->
<!--                    </div>-->
                    <div class="form-group">
                        <label for="Name" class="sr-only">Nama</label>
                        <input type="text" v-model="register.name" id="Name" class="form-control" placeholder="nama" required>
                    </div>
                    <div class="form-group">
                        <label for="Email" class="sr-only">Alamat Email</label>
                        <input type="email" v-model="register.email" id="Email" class="form-control" placeholder="alamat email" required>
                    </div>
                    <div class="form-group">
                        <label for="Password" class="sr-only">Kata Sandi</label>
                        <input type="password" v-model="register.password" id="Password" class="form-control" placeholder="kata sandi" required>
                    </div>
                    <div class="form-group">
                        <label for="ConfirmPassword" class="sr-only">Ulangi Kata Sandi</label>
                        <input type="password" v-model="register.confirm_password" id="ConfirmPassword" class="form-control" placeholder="ulangi kata sandi" required>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" :disabled="isRegisterProcess"><i v-if="isRegisterProcess" class="fa fa-login fa-refresh fa-spin"></i>Daftar</button>
                    <p style="margin-top:10px;">Sudah punya akun: <a @click.prevent="isLogin=true" style="text-decoration: underline;color: #007bff;cursor: pointer;">Login disini</a></p>
                </form>
            </div>
        </div>
        <p class="mt-5 mb-3 text-muted">created by Teknologi Karya Anak Muda</p>
    </div>
  </div>
</template>

<script>
import Api from "../apis";
import toastr from "toastr";
import Cookie from "vue-cookie";
export default {
    data() {
        return {
            isLogin: true,
            isRegisterProcess: false,
            isRegisterAlert: false,
            email: "",
            password: "",
            registerMessage: "",
            register: {
                name: '',
                email: '',
                password: '',
                confirm_password:''
            }
        }
    },
    methods: {
        login() {
          this.$store.dispatch("login", {
            email: this.email,
            password: this.password
          }).then((res) => {
              let companies = JSON.parse(Cookie.get("myProfile")).companies;
              if (companies.length>0) this.$router.push("/");
              else this.$router.push({ name: 'company-create'});
          });
        },
        doRegister() {
            this.$set(this,'isRegisterProcess',true);
            Api.auth.register(this.register).then((res)=>{
                this.$set(this,'isLogin',true);
                this.$set(this,'isRegisterAlert',true);
                this.$set(this,'registerMessage',res.data.message);
                this.$set(this,'isRegisterProcess',false);
                this.clearForm();
            }).catch((err)=>{
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                this.$set(this,'isRegisterProcess',false);
            });
        },
        clearForm() {
            this.$set(this.register,'name','');
            this.$set(this.register,'email','');
            this.$set(this.register,'password','');
            this.$set(this.register,'confirm_password','');
        }
    },
    computed: {
        isPending(){
          return this.$store.getters.isPending;
        },
        isError(){
          return this.$store.getters.isError;
        },
        messages(){
          return this.$store.getters.messages;
        }
    }
}
</script>
