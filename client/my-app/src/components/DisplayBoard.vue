<template>
    <div class="display-board">
        <h4>Transações importadas</h4>
        <div class="number">
        {{numberOfTransactions}}
        </div>
        <div class="btn">
            <button @click='getAllTransactions()' type="button" class="btn btn-warning">Obter transações</button>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'DisplayBoard',
        props: ['numberOfTransactions'],
        methods: {
            getAllTransactions() {
                this.$emit('getAllTransactions')
            }
        }
    }
</script>