<template>
  <div class="container-fluid">
    <div class="col-10 offset-1">
      <h2>Transações importadas</h2>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Nome da loja</th>
            <th>Dono da loja</th>
            <th>Tipo</th>
            <th>Data</th>
            <th>Valor</th>
            <th>CPF</th>
            <th>Cartão</th>
            <th>Hora</th>
            <th>Saldo em conta</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in transactions" :key="index">
            <td>{{ item.store_name }}</td>
            <td>{{ item.store_owner }}</td>
            <td>{{ item.description }}</td>
            <td>{{ item.occurrence_date }}</td>
            <td>{{ item.amount }}</td>
            <td>{{ item.cpf }}</td>
            <td>{{ item.card_number }}</td>
            <td>{{ item.occurrence_time }}</td>
            <td>{{ item.store_amount_total }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: "Transactions",
  props: ["transactions"],
};
</script>