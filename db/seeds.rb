puts 'Deleting old data'
TransactionType.delete_all

puts 'Creating transaction types'
TransactionType.create(id: 1, description: 'Débito', kind: :input)
TransactionType.create(id: 2, description: 'Boleto', kind: :output)
TransactionType.create(id: 3, description: 'Financiamento', kind: :output)
TransactionType.create(id: 4, description: 'Crédito', kind: :input)
TransactionType.create(id: 5, description: 'Recebimento Empréstimo', kind: :input)
TransactionType.create(id: 6, description: 'Vendas', kind: :input)
TransactionType.create(id: 7, description: 'Recebimento TED', kind: :input)
TransactionType.create(id: 8, description: 'Recebimento DOC', kind: :input)
TransactionType.create(id: 9, description: 'Aluguel', kind: :output)
