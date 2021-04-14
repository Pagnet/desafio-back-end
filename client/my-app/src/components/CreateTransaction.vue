<template>
  <div class="container">
    <div class="row">
      <div class="col-md-7 mrgnbtm">
        <h2>Importar CNAB</h2>
        <form>
          <div class="row">
            <div class="form-group col-md-12">
              <label htmlFor="exampleInputEmail1">Arquivo</label>
              <input
                type="file"
                name="file"
                class="form-control"
                ref="file"
                v-on:change="handleFileUpload()"
              />
            </div>
          </div>
          <button
            type="button"
            @click="createTransaction()"
            class="btn btn-danger"
          >
            Importar
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CreateTransaction",
  data() {
    return {
      file: "",
    };
  },
  methods: {
    createTransaction() {
      console.log(this.file);
      this.$emit("createTransaction", this.file);
      this.clearForm();
    },
    handleFileUpload() {
      this.file = this.$refs.file.files[0];
    },
    clearForm() {
      this.file = '';
    },
  },
};
</script>