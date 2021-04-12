# command: rake db:seed:create_transaction_types

puts "Seed: create_transaction_types"

TransactionType.delete_all

TransactionType.create(
  numeric_type: 1,
  description: "Débito",
  operation_type: "entrada",
  signal: "positive",
)

TransactionType.create(
  numeric_type: 2,
  description: "Boleto",
  operation_type: "saída",
  signal: "negative",
)

TransactionType.create(
  numeric_type: 3,
  description: "Financiamento",
  operation_type: "saída",
  signal: "negative",
)

TransactionType.create(
  numeric_type: 4,
  description: "Crédito",
  operation_type: "entrada",
  signal: "positive",
)

TransactionType.create(
  numeric_type: 5,
  description: "Recebimento Empréstimo",
  operation_type: "entrada",
  signal: "positive",
)

TransactionType.create(
  numeric_type: 6,
  description: "Vendas",
  operation_type: "entrada",
  signal: "positive",
)

TransactionType.create(
  numeric_type: 7,
  description: "Recebimento TED",
  operation_type: "entrada",
  signal: "positive",
)

TransactionType.create(
  numeric_type: 8,
  description: "Recebimento DOC",
  operation_type: "entrada",
  signal: "positive",
)

TransactionType.create(
  numeric_type: 9,
  description: "Aluguel",
  operation_type: "saída",
  signal: "negative",
)
