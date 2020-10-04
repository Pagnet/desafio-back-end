module TransactionsHelper
  def type_description(integer)
    descriptions = ['', 'Débito', 'Boleto', 'Financiamento', 'Crédito', 'Recebimento Empréstimo',
                    'Vendas', 'Recebimento TED', 'Recebimento DOC', 'Aluguel']
    descriptions[integer]
  end
end
