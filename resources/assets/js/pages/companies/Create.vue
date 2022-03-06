<template>
    <div class="sign-in-body" >
        <div class="text-center" style="margin:auto">
            <h6 class="alert-not-have-company">Anda belum memiliki perusahaan</h6>
            <div class="card mt-4" style="width: 350px">
                <div class="card-header"><a href="#" class="nav-link" v-if="isLoggedIn" @click="logout">
                    <i class="fa fa-sign-out text-danger float-right" style="font-size: 20px;" title="Keluar"></i>
                </a></div>
                <div class="card-body">
                    <button class="btn btn-primary" :class="{'active':isCreate}" v-on:click="isCreate=true">Buat</button>
                    <button class="btn btn-primary" :class="{'active':!isCreate}" v-on:click="isCreate=false">Bergabung</button>
                    <form v-if="isCreate" class="form-signin" @submit.prevent="createCompany()" >
                        <h5 class="h5 mb-3 font-weight-normal">Buat perusahaanmu disini</h5>
<!--                        <div v-if="isError" class="alert alert-danger">-->
<!--                            <strong>Danger!</strong> {{messages}}-->
<!--                        </div>-->
<!--                        <div v-if="isRegisterAlert" class="alert alert-success">-->
<!--                            <strong>Berhasil!</strong> {{registerMessage}}-->
<!--                        </div>-->
                        <div class="form-group">
                            <label for="company-name-create" class="sr-only">Nama Perusahaan</label>
                            <input type="text" v-model="create.name" id="company-name-create" class="form-control" placeholder="nama perusahaan" required>
                        </div>
                        <div class="form-group">
                            <label for="company-address-create" class="sr-only">Alamat Perusahaan</label>
                            <input type="text" v-model="create.address" id="company-address-create" class="form-control" placeholder="alamat perusahaan" required>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit" :disabled="isPending"><i v-if="isPending" class="fa fa-login fa-refresh fa-spin"></i>Simpan</button>
                    </form>

                    <form v-if="!isCreate" class="form-signin" @submit.prevent="joinCompany()" >
                        <h5 class="h5 mb-3 font-weight-normal">Masukan kode untuk bergabung dengan perusahaan</h5>
<!--                        <div v-if="isError" class="alert alert-danger">-->
<!--                            <strong>Danger!</strong> {{messages}}-->
<!--                        </div>-->
                        <div class="form-group">
                            <label for="company-code-join" class="sr-only">Kode Perusahaan</label>
                            <input type="text" v-model="join_company" id="company-code-join" class="form-control" placeholder="kode perusahaan" required>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit" :disabled="isJoinProcess"><i v-if="isJoinProcess" class="fa fa-login fa-refresh fa-spin"></i>Gabung</button>
                    </form>
                </div>
            </div>
            <p class="mt-5 mb-3 text-muted">created by Teknologi Karya Anak Muda</p>
        </div>
    </div>
</template>

<script>
    import Api from "../../apis";
    import axios from "axios";
    import Cookie from "vue-cookie";
    export default {
        name: "Create",
        data() {
            return {
                isCreate: true,
                isJoinProcess: false,
                isRegisterAlert: false,
                registerMessage: "",
                join_company: "",
                create: {
                    name: '',
                    address: ''
                }
            }
        },
        mounted () {
            axios.interceptors.request.use(
                (config) => {
                    let token = Cookie.get('token');
                    if (token) {
                        config.headers['Authorization'] = 'Bearer ' + token
                    }
                    return config
                },
                (error) => {
                    return Promise.reject(error)
                }
            );
            axios.interceptors.response.use(undefined, function (err) {
                return new Promise(function (resolve, reject) {
                    if (err.status === 401 && err.config && !err.config.__isRetryRequest) {
                        this.$store.dispatch('logout');
                        this.$router.push({name: 'login'})
                    }
                    throw err
                });
            });
        },
        methods: {
            createCompany(){
                let profile = JSON.parse(Cookie.get("myProfile"));
                Api.company.store(this.create).then((res)=>{
                    profile.companies = [res.data.data];
                    Cookie.set('myProfile', JSON.stringify(profile), { expires: '6h' });
                    Cookie.set('companySelected', JSON.stringify(res.data.data), { expires: '6h' });
                    this.$router.push("/");
                }).catch((err)=>{
                    if(err.response.status === 401){
                        alert("Token Expired");
                        this.$store.dispatch('logout').then(() => {
                            this.$router.push("/login");
                        });
                    }else{
                        alert("Terjadi Kesalahan pada server");
                    }
                });
            },
            joinCompany(){
                let profile = JSON.parse(Cookie.get("myProfile"));
                Api.company.join({code: this.join_company}).then((res) => {
                    profile.companies= [res.data.data];
                    Cookie.set('myProfile', JSON.stringify(profile), { expires: '6h' });
                    Cookie.set('companySelected', JSON.stringify(res.data.data), { expires: '6h' });
                    this.$router.push("/");
                }).catch((err)=>{
                    if(err.response.status === 401){
                        alert("Token Expired");
                        this.$store.dispatch('logout').then(() => {
                            this.$router.push("/login");
                        });
                    }else{
                        alert("Terjadi Kesalahan pada server");
                    }
                });
            },
            logout() {
                this.$store.dispatch('logout').then(() => {
                    this.$router.push("/login")
                });
            },
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
            },
            isLoggedIn() {
                return this.$store.getters.isLoggedIn;
            }
        }
    }
</script>
<style>
    .alert-not-have-company {
        background-color: #ffba99;
        border-radius: 5px;
        padding: 10px;
    }
</style>