<template>
    <div>
        <modal :show="show" @close="closeModal">
            <div class="modal-body">
                <slot name="body">
                    <div class="card">
                        <div class="card-header bg-light">
                            Detail Tagihan
                        </div>
                        <div class="card-body" style="padding: 3px">
                            <table class="table table-striped table-responsive-sm">
                                <tr>
                                    <td><span class="text-secondary">Jatuh Tempo</span></td>
                                    <td>:</td>
                                    <td><span class="text-dark">{{ '10 '+ moment().format('MMMM YYYY') }}</span></td>
                                    <td><span class="text-secondary">Stand Meter</span></td>
                                    <td>:</td>
                                    <td class="column-number"><span class="text-dark">{{ data.previous_measurement + '\ts/d\t' + data.current_measurement }}</span></td>
                                </tr>
                                <tr>
                                    <td><span class="text-secondary">Periode</span></td>
                                    <td>:</td>
                                    <td><span class="text-dark">{{ moment().format('MMMM YYYY') }}</span></td>
                                    <td><span class="text-secondary">Jumlah Meter</span></td>
                                    <td>:</td>
                                    <td class="column-number"><span class="text-dark">{{ data.current_measurement - data.previous_measurement }}</span></td>
                                </tr>
                                <tr v-for="(price, index) in data.prices" v-bind:key="index">
                                    <td v-if="index === 0"><span class="text-secondary">ID Pelanggan</span></td>
                                    <td v-if="index === 0">:</td>
                                    <td v-if="index === 0"><span class="text-dark">{{ data.member_id }}</span></td>
                                    <td v-if="index === 1"><span class="text-secondary">Nama</span></td>
                                    <td v-if="index === 1">:</td>
                                    <td v-if="index === 1"><span class="text-dark">{{ data.customer }}</span></td>
                                    <td v-if="index === 2"><span class="text-secondary">Alamat</span></td>
                                    <td v-if="index === 2">:</td>
                                    <td v-if="index === 2"><span class="text-dark">{{ data.address }}</span></td>
                                    <td v-if="index > 2">&nbsp;</td>
                                    <td v-if="index > 2">&nbsp;</td>
                                    <td v-if="index > 2">&nbsp;</td>

                                    <td><span class="text-secondary">{{ price.name }}</span></td>
                                    <td>:</td>
                                    <td class="column-number"><span class="text-dark">{{ "Rp "+(price.price && price.price.toLocaleString('id-ID')) || null }}</span></td>
                                </tr>
                                <tr>
                                    <td><span class="text-secondary">Kategori</span></td>
                                    <td>:</td>
                                    <td><span class="text-dark">{{ data.rate }}</span></td>
                                    <td><span class="text-secondary">TOTAL BAYAR</span></td>
                                    <td>:</td>
                                    <td class="column-number" style="border-top: 2px solid #000000"><span class="text-dark">{{ "Rp "+(data.total_price && data.total_price.toLocaleString('id-ID')) || null }}</span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </slot>
            </div>

            <div class="modal-footer">
                <slot name="footer">
                    <button class="modal-default-button" @click="$emit('closeModal')">
                        Tutup
                    </button>
                </slot>
            </div>
        </modal>
    </div>
</template>

<script>
    import Modal from '../../components/_templates/Modal'
    import Moment from 'moment'
    export default {
        name: "BillingDetailModal",
        props: ['show', 'data'],
        data(){
            return {
                moment: Moment,
            }
        },
        components: { Modal },
        methods: {
            closeModal: function() {
                this.$emit('close-modal')
            }
        }
    }
</script>
<style scoped>
    .wrapper-body {
        float: left;
    }
    .column-label {

    }
    .column-number {
        text-align: right;
    }
    tr {
        height: 30px;
    }
</style>
