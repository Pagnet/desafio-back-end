# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TipoTransacao.create!(descricao: 'Débito', natureza: 1, sinal: 1)
TipoTransacao.create!(descricao: 'Boleto', natureza: 0, sinal: 0)
TipoTransacao.create!(descricao: 'Financiamento', natureza: 0, sinal: 0)
TipoTransacao.create!(descricao: 'Crédito', natureza: 1, sinal: 1)
TipoTransacao.create!(descricao: 'Recebimento Empréstimo', natureza: 1, sinal: 1)
TipoTransacao.create!(descricao: 'Vendas', natureza: 1, sinal: 1)
TipoTransacao.create!(descricao: 'Recebimento TED', natureza: 1, sinal: 1)
TipoTransacao.create!(descricao: 'Recebimento DOC', natureza: 1, sinal: 1)
TipoTransacao.create!(descricao: 'ALuguel', natureza: 0, sinal: 0)