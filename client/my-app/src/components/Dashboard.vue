<template>
  <div class="hello">
    <Header />
    <div class="container mrgnbtm">
      <div class="row">
        <div class="col-12" v-if="showDismissibleAlert">
          <div class="alert alert-danger alert-dismissible fade" role="alert" :class="{ show: showDismissibleAlert }">
            <strong>{{ errorMessage }}</strong>
            <button
              type="button"
              class="close"
              data-dismiss="alert"
              aria-label="Close"
              @click="hideAlert()"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        </div>
        <div class="col-md-8">
          <CreateTransaction @createTransaction="transactionCreate($event)" />
        </div>
        <div class="col-md-4">
          <DisplayBoard
            :numberOfTransactions="numberOfTransactions"
            @getAllTransactions="getAllTransactions()"
          />
        </div>
      </div>
    </div>
    <div class="row mrgnbtm">
      <Transactions
        v-if="transactions.length > 0"
        :transactions="transactions"
      />
    </div>
  </div>
</template>

<script>
import Header from "./Header.vue";
import CreateTransaction from "./CreateTransaction.vue";
import DisplayBoard from "./DisplayBoard.vue";
import Transactions from "./Transactions.vue";
import {
  getAllTransactions,
  createTransaction,
} from "../services/TransactionService";

export default {
  name: "Dashboard",
  components: {
    Header,
    CreateTransaction,
    DisplayBoard,
    Transactions,
  },
  data() {
    return {
      transactions: [],
      numberOfTransactions: 0,
      errorMessage: "Arquivo inválido",
      showDismissibleAlert: false,
    };
  },
  methods: {
    getAllTransactions() {
      getAllTransactions().then((response) => {
        this.transactions = response;
        this.numberOfTransactions = this.transactions.length;
      });
    },
    transactionCreate(data) {
      createTransaction(data).then((response) => {
        if (response.status != 200) {
          this.showAlert();
        } else {
          this.getAllTransactions();
        }
      });
    },
    showAlert() {
      this.showDismissibleAlert = true;
    },
    hideAlert() {
      this.showDismissibleAlert = false;
    },
  },
  mounted() {
    this.getAllTransactions();
  },
};
</script>