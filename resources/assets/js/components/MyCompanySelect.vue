<template>
    <div class="row justify-content-end">
        <div class="col-md-4 text-right">Pilih Perusahaan: </div>
        <div class="col-md-8">
            <my-vue-select
                    id="companies"
                    :clear-selected="false"
                    :default-selected="companySelected"
                    :default-options="companyOptions"
                    :searchable="false"
                    @result="companyResult"
            >
            </my-vue-select>
        </div>
    </div>
</template>

<script>
    import Cookie from "vue-cookie";

    export default {
        name: "MyCompanySelect",
        data() {
            return {
                companySelected: JSON.parse(Cookie.get("companySelected")),
                companyOptions: JSON.parse(Cookie.get("myProfile")).companies,
            }
        },
        methods: {
            companyResult(event) {
                Cookie.set('companySelected', JSON.stringify(event), { expires: '6h' });
                window.events.$emit('my-company-select:changed', event);
            }
        }
    }
</script>

<style scoped>

</style>
