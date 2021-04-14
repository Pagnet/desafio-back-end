<template>
  <div class="hello">
    <Header />
    <div class="container mrgnbtm">
          <div class="row">
            <div class="col-md-8">
                <CreateTransaction @createTransaction="transactionCreate($event)" />
            </div>
            <div class="col-md-4">
                <DisplayBoard :numberOfTransactions="numberOfTransactions" @getAllTransactions="getAllTransactions()" />
            </div>
          </div>
    </div>
    <div class="row mrgnbtm">
        <Transactions v-if="transactions.length > 0" :transactions="transactions" />
    </div>
  </div>
</template>

<script>
import Header from './Header.vue'
import CreateTransaction from './CreateTransaction.vue'
import DisplayBoard from './DisplayBoard.vue'
import Transactions from './Transactions.vue'
import { getAllTransactions, createTransaction } from '../services/TransactionService'

export default {
  name: 'Dashboard',
  components: {
    Header,
    CreateTransaction,
    DisplayBoard,
    Transactions
  },
  data() {
      return {
          transactions: [],
          numberOfTransactions: 0
      }
  },
  methods: {
    getAllTransactions() {
      getAllTransactions().then(response => {
        console.log(response)
        this.transactions = response
        this.numberOfTransactions = this.transactions.length
      })
    },
    transactionCreate(data) {
      console.log('data:::', data)
      createTransaction(data).then(response => {
        console.log(response);
        this.getAllTransactions();
      });
    }
  },
  mounted () {
    this.getAllTransactions();
  }
}
</script>