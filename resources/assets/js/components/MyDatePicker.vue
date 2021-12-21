<template>
    <datepicker
            ref="myDatepicker"
            :name="name"
            :id="id"
            :clear-button="isClearButton"
            :language="languages[language]"
            :format="format"
            class="my-datepicker"
            input-class="form-control custom-style"
            :value.sync="startDate"
            v-model="result"
            :placeholder="placeholder"
    ></datepicker>
</template>

<script>
    import Datepicker from "vuejs-datepicker/dist/vuejs-datepicker.esm.js";
    import * as lang from "vuejs-datepicker/src/locale";
    import moment from 'moment';

    let state = {
        date: new Date(2016, 9,  16)
    };
    function getDate () {
        const toTwoDigits = num => num < 10 ? '0' + num : num;
        let today = new Date();
        let year = today.getFullYear();
        let month = toTwoDigits(today.getMonth() + 1);
        let day = toTwoDigits(today.getDate());
        return `${day}/${month}/${year}`;
    }
    export default {
        name: 'MyDatePicker',
        props: {
            id: [String, Number],
            name: String,
            isClearResult: Boolean,
            isClearButton: Boolean,
            placeholder: String,
            language: {
                type: String,
                default: 'id'
            },
            format: {
                type: String,
                default: 'd MMMM yyyy'
            },
            resultProps: String,
            value: [String, Date, Number]
        },
        components: {
            Datepicker
        },
        data() {
            return {
                eventMsg: null,
                state: state,
                languages: lang,
                result: '',
                startDate: getDate(),
            };
        },
        watch: {
            resultProps: function (val, oldValue) {
                if (!_.isEqual(val,oldValue)) this.$set(this,'result',val);
            },
            result: function (value, oldValue) {
                if (!_.isEqual(value,oldValue)) {
                    this.$emit('update:resultProps', moment(value).format('YYYY-MM-DD'));
                }
            },
            isClearResult: function (value) {
                if (value) this.$refs.myDatepicker.clearDate();
            }
        }
    }
</script>
<style scoped>
     .my-datepicker >>> .custom-style {
        background-color: unset!important;
    }
    .bg-red > div > input {
        background-color:red
    }

    .bg-white > div > div {
        background-color:white
    }
</style>
