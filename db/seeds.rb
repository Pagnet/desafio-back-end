# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TransactionKind.create([
{ kind: 1, description: "Débito", nature:	"Entrada", signal: "+" },
{ kind: 2, description: "Boleto", nature:	"Saída", signal: "-" },
{ kind: 3, description: "Financiamento", nature:	"Saída", signal: "-" },
{ kind: 4, description: "Crédito", nature:	"Entrada", signal: "+" },
{ kind: 5, description: "Recebimento Empréstimo", nature: "Entrada", signal: "+" },
{ kind: 6, description: "Vendas", nature:	"Entrada", signal: "+" },
{ kind: 7, description: "Recebimento", nature: "TED	Entrada", signal:	"+" },
{ kind: 8, description: "Recebimento", nature: "DOC	Entrada", signal:	"+" },
{ kind: 9, description: "Aluguel", nature:	"Saída", signal: "-" },
])

Company.create([
 { owner_name: "JOÃO MACEDO", name: "BAR DO JOÃO" },
 { owner_name: "MARIA JOSEFINA", name: "LOJA DO Ó - MATRIZ" },
 { owner_name: "MARIA JOSEFINA", name: "LOJA DO Ó - FILIAL" },
 { owner_name: "JOSÉ COSTA", name: "MERCEARIA 3 IRMÃOS" },
 { owner_name: "MARCOS PEREIRA", name: "MERCADO DA AVENIDA" },
])
