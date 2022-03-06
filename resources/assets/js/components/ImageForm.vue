<template>
    <div v-if="!image" class="form-group">
        <label for="image">{{label}}</label>
        <div class="dropbox">
            <input type="file" id="image"  @change="onFileChange"
                   accept="image/*" class="input-file" >
            <p v-if="isInitial">
                Drag your file(s) here to begin<br> or click to browse
            </p>
        </div>
    </div>
    <div v-else>
        <img :src="image" width="200" height="200" />
        <button type="button" @click="removeImage">Remove image</button>
    </div>
</template>

<script>
    export default {
        name: "ImageForm",
        props: {
            originImage: {
                type: String,
                default: null
            },
            label: String
        },
        data() {
            return {
                isInitial:true,
                image: this.originImage||'',
                attachment: ''
            }
        },
        watch: {
            image: function () {
                this.attachment ? this.$emit('result',this.attachment)
                : this.$emit('result',this.image);
            }
        },
        methods: {
            onFileChange(e) {
                var files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                this.attachment=files[0];
                this.createImage(files[0]);
            },
            createImage(file) {
                var image = new Image();
                var reader = new FileReader();
                var vm = this;
                this.isInitial = false;
                reader.onload = (e) => {
                    vm.image = e.target.result;
                };
                reader.readAsDataURL(file);
            },
            removeImage: function (e) {
                this.image = '';
                this.isInitial = true;
            }
        }
    }
</script>

<style scoped>

</style>
