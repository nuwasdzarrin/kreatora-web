<template>
    <div>
        <modal :show="show" @close="closeModal">
            <div class="modal-header">
                <slot name="header">
                    <h4>Detail Tagihan</h4>
                </slot>
            </div>

            <div class="modal-body">
                <slot name="body">
                    <div class="row justify-content-between">
                        <div class="col-md-5">
                            <div class="card">
                                <div class="card-header bg-light">
                                    Pelanggan
                                </div>
                                <div class="card-body">
                                    <div>
                                        <span class="text-secondary">Nama : </span>
                                        <span class="text-dark">{{ data.customer }}</span>
                                    </div>
                                    <div>
                                        <span class="text-secondary">Alamat : </span>
                                        <span class="text-dark">{{ data.address }}</span>
                                    </div>
                                    <div>
                                        <span class="text-secondary">Kategori : </span>
                                        <span class="text-dark">{{ data.rate }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="card">
                                <div class="card-header bg-light">
                                    Detail Kategori
                                </div>
                                <div class="card-body">
                                    <div v-for="(rate, index) in data.prices"  v-bind:key="index">
                                        <span class="text-secondary">{{ rate.name }} : </span>
                                        <span class="text-dark">{{ "Rp "+rate.multiplier.toLocaleString('id-ID') + ' /m3' }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header bg-light">
                                    Kategori {{ data.rate }}
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div>
                                                <span class="text-secondary">Nama : </span>
                                                <span class="text-dark">{{ data.customer }}</span>
                                            </div>
                                            <div>
                                                <span class="text-secondary">Alamat : </span>
                                                <span class="text-dark">{{ data.address }}</span>
                                            </div>
                                            <div>
                                                <span class="text-secondary">Kategori : </span>
                                                <span class="text-dark">{{ data.rate }}</span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div>
                                                <span class="text-secondary">Nama : </span>
                                                <span class="text-dark">Antasi Azar</span>
                                            </div>
                                            <div>
                                                <span class="text-secondary">Nama : </span>
                                                <span class="text-dark">Antasi Azar</span>
                                            </div>
                                            <div>
                                                <span class="text-secondary">Nama : </span>
                                                <span class="text-dark">Antasi Azar</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
    export default {
        name: "RateDetailModal",
        props: ['show', 'data'],
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
</style>
