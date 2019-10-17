# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  input = TransactionKind.find_or_create_by(id: 1, description: 'Entrada', signal: '+')
  output = TransactionKind.find_or_create_by(id: 2, description: 'Saída', signal: '-')

  TransactionType.find_or_create_by(id: 1, description: 'Débito', transaction_kind: input)
  TransactionType.find_or_create_by(id: 2, description: 'Boleto', transaction_kind: output)
  TransactionType.find_or_create_by(id: 3, description: 'Financiamento', transaction_kind: output)
  TransactionType.find_or_create_by(id: 4, description: 'Crédito', transaction_kind: input)
  TransactionType.find_or_create_by(id: 5, description: 'Recebimento Empréstimo', transaction_kind: input)
  TransactionType.find_or_create_by(id: 6, description: 'Vendas', transaction_kind: input)
  TransactionType.find_or_create_by(id: 7, description: 'Recebimento TED', transaction_kind: input)
  TransactionType.find_or_create_by(id: 8, description: 'Recebimento DOC', transaction_kind: input)
  TransactionType.find_or_create_by(id: 9, description: 'Aluguel', transaction_kind: output)
end

