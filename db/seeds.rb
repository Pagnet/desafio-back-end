TransactionType.find_or_create_by!(
  key: 1,
  description: 'Débito',
  movement_type: :input,
  icon_representation: '+'
)
TransactionType.find_or_create_by!(
  key: 2,
  description: 'Boleto',
  movement_type: :output,
  icon_representation: '-'
)
TransactionType.find_or_create_by!(
  key: 3,
  description: 'Financiamento',
  movement_type: :output,
  icon_representation: '-'
)
TransactionType.find_or_create_by!(
  key: 4,
  description: 'Crédito',
  movement_type: :input,
  icon_representation: '+'
)
TransactionType.find_or_create_by!(
  key: 5,
  description: 'Recebimento Empréstimo',
  movement_type: :input,
  icon_representation: '+'
)
TransactionType.find_or_create_by!(
  key: 6,
  description: 'Vendas',
  movement_type: :input,
  icon_representation: '+'
)
TransactionType.find_or_create_by!(
  key: 7,
  description: 'Recebimento TED',
  movement_type: :input,
  icon_representation: '+'
)
TransactionType.find_or_create_by!(
  key: 8,
  description: 'Recebimento DOC',
  movement_type: :input,
  icon_representation: '+'
)
TransactionType.find_or_create_by!(
  key: 9,
  description: 'Aluguel',
  movement_type: :output,
  icon_representation: '-'
)