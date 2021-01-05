if TransactionType.count == 0
  TransactionType.create(
    [
      {sort: 1, description: 'Débito',                 kind: 'input', signal: 'positive'},
      {sort: 2, description: 'Boleto',                 kind: 'output', signal: 'negative'},
      {sort: 3, description: 'Financiamento',          kind: 'output', signal: 'negative'},
      {sort: 4, description: 'Crédito',                kind: 'input', signal: 'positive'},
      {sort: 5, description: 'Recebimento Empréstimo', kind: 'input', signal: 'positive'},
      {sort: 6, description: 'Vendas',                 kind: 'input', signal: 'positive'},
      {sort: 7, description: 'Recebimento TED',        kind: 'input', signal: 'positive'},
      {sort: 8, description: 'Recebimento DOC',        kind: 'input', signal: 'positive'},
      {sort: 9, description: 'Aluguel',                kind: 'output', signal: 'negative'}
    ]
  )
end