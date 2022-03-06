<template>
    <div class="modal inmodal" id="printBillingModalId" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated fadeIn">
                <div class="modal-header" style="padding: 15px; border-bottom: 0">
                    <button type="button" class="close" data-dismiss="modal" style="opacity: 1;">
                        <i class="fa fa-close text-primary" aria-hidden="true" style="font-size: 20px"></i>
                        <span class="sr-only">Close</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <h5 class="text-primary" style="margin-top: -20px"><b>Cetak Tagihan</b></h5>
                    <p>Pilih batas tanggal tagihan yang akan dicetak</p>
                    <form role="form" method="POST" action="/print_billings" target="_blank">
                        <input type="hidden" name="pdf" value="print this">
                        <input type="hidden" name="_token" :value="csrf">
                        <input type="hidden" name="company_id" :value="company_id">
                        <input type="hidden" name="date_after" :value="date_after">
                        <input type="hidden" name="date_before" :value="date_before">
                        <div class="form-group">
                            <div class="input-date" style="display: flex; align-items: center;">
                                <div style="display: flex; justify-content: center; align-items: center; height: 38px; width: 38px; border: 1px solid #C9C9C9; border-right: 0">
                                    <i class="fa fa-calendar" style="font-size: 18px; color: #98A9CB;"></i>
                                </div>
                                <div style="width: 100%">
                                     <my-date-picker id="date-after" placeholder="Tanggal Mulai" @result="dateAfter"></my-date-picker>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-date" style="display: flex; align-items: center;">
                                <div style="display: flex; justify-content: center; align-items: center; height: 38px; width: 38px; border: 1px solid #C9C9C9; border-right: 0">
                                    <i class="fa fa-calendar" style="font-size: 18px; color: #98A9CB;"></i>
                                </div>
                                <div style="width: 100%">
                                    <my-date-picker id="date-before" :is-clear-result="clear_date_before" placeholder="Tanggal Berakhir" :resultProps="date_before" @result="dateBefore"></my-date-picker>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-block btn-lg btn-primary">Cetak</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Cookie from "vue-cookie";

    export default {
        name: "PrintBillingModal",
        data: () => {
            return {
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                company_id: JSON.parse(Cookie.get("companySelected")).id,
                date_after: '',
                date_before: '',
                clear_date_before: false
            }
        },
        methods: {
            dateAfter: function (event) {
                this.$set(this,'date_after', event)
            },
            dateBefore: function (event) {
                if (this.date_after && this.date_after>event) {
                    alert("Tanggal akhir harus lebih besar dari pada tanggal mulai");
                    this.$set(this,'clear_date_before',true);
                    return null;
                } else {
                    this.$set(this,'clear_date_before',false);
                    this.$set(this,'date_before', event);
                }
            }
        }
    }
</script>

<style scoped>

</style>
