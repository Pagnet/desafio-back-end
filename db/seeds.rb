# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TransactionType.create([
  {
    type_num: 1,
    description: 'Débito',
    nature: 'income',
  },
  {
    type_num: 2,
    description: 'Boleto',
    nature: 'outcome',
  },
  {
    type_num: 3,
    description: 'Financiamento',
    nature: 'outcome',
  },
  {
    type_num: 4,
    description: 'Crédito',
    nature: 'income',
  },
  {
    type_num: 5,
    description: 'Recebimento Empréstimo',
    nature: 'income',
  },
  {
    type_num: 6,
    description: 'Vendas',
    nature: 'income',
  },
  {
    type_num: 7,
    description: 'Recebimento TED',
    nature: 'income',
  },
  {
    type_num: 8,
    description: 'Recebimento DOC',
    nature: 'income',
  },
  {
    type_num: 9,
    description: 'Aluguel',
    nature: 'outcome',
  },
])
