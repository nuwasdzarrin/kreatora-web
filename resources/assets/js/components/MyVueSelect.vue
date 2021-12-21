<template>
    <vue-select
            label="name"
            :clearable="clearSelected"
            :filterable="false"
            :options="options"
            :placeholder="placeholder"
            :searchable="searchable"
            @search="onSearch"
            :id="id"
            v-model="selected">
        <template slot="no-options">
            {{ caption }}
        </template>
<!--        <template slot="option" slot-scope="option">-->
<!--            <div class="d-center">-->
<!--                <img :src='option.owner.avatar_url'/>-->
<!--                {{ option.full_name }}-->
<!--            </div>-->
<!--        </template>-->
        <template slot="option" slot-scope="option">
            <div class="d-center">
                {{ option.name + (showAddress?(' - ' + option.address):'') }}
            </div>
        </template>
        <template slot="selected-option" slot-scope="option">
            <div class="selected d-center">
                {{ option.name + (showAddress?(' - ' + option.address):'') }}
            </div>
        </template>
    </vue-select>
</template>

<script>
    import VueSelect from 'vue-select';
    import Cookie from 'vue-cookie';
    export default {
        name: "MyVueSelect",
        props: {
            id: String,
            caption: String,
            clearSelected: {
                type: Boolean,
                default: true
            },
            params: String,
            url: String,
            showAddress: {
                type: Boolean,
                default: false
            },
            defaultOptions: {
                type: Array,
                default: function () {
                    return []
                }
            },
            defaultSelected: {
                type: Object,
                default: function () {
                    return {}
                }
            },
            placeholder: String,
            searchable: {
                type: Boolean,
                default: true
            }
        },
        components: {
            VueSelect
        },
        data() {
            return {
                options: this.defaultOptions.length?this.defaultOptions:[],
                selected: {
                    name: this.defaultSelected.name||''
                }
            }
        },
        watch: {
            defaultSelected: function (val) {
                console.log(val);
            },
            selected: function (val, oldVal) {
                if(!_.isEqual(val,oldVal)) this.$emit('result', val);
            }
        },
        methods: {
            onSearch(search, loading) {
                if(this.defaultOptions.length) return null;
                loading(true);
                this.search(loading, search, this);
            },
            search: _.debounce((loading, search, vm) => {
                const request = new Request(vm.url+'?search='+search+(vm.params?vm.params:''), {
                    headers: new Headers({
                        'Authorization' : 'Bearer '+ Cookie.get('token'),
                        'Content-Type'  : 'application/json',
                        'Accept'        : 'application/json'
                    })
                });
                fetch(request).then(res => {
                    res.json().then(json => (vm.options = json.data));
                    loading(false);
                });
            }, 350)
        }
    }
</script>

<style scoped>
    @import '~vue-select/dist/vue-select.css';
    img {
        height: auto;
        max-width: 2.5rem;
        margin-right: 1rem;
    }
    .d-center {
        display: flex;
        align-items: center;
    }
    .selected img {
        width: auto;
        max-height: 23px;
        margin-right: 0.5rem;
    }
    .v-select .dropdown li {
        border-bottom: 1px solid rgba(112, 128, 144, 0.1);
    }
    .v-select .dropdown li:last-child {
        border-bottom: none;
    }
    .v-select .dropdown li a {
        padding: 10px 20px;
        width: 100%;
        font-size: 1.25em;
        color: #3c3c3c;
    }
    .v-select .dropdown-menu .active > a {
        color: #fff;
    }
</style>
