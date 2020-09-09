class Transaction < ApplicationRecord

  validates :kind,
            :kind_description,
            :processed_at,
            :amount,
            :cpf,
            :card, presence: true

  belongs_to :store
  belongs_to :importer

  after_create :update_store_balance

  KINDS = {
    "1": { kind: "input", description: "Débito" },
    "2": { kind: "output", description: "Boleto" },
    "3": { kind: "output", description: "Financiamento" },
    "4": { kind: "input", description: "Crédito" },
    "5": { kind: "input", description: "Recebimento Empréstimo" },
    "6": { kind: "input", description: "Vendas" },
    "7": { kind: "input", description: "Recebimento TED" },
    "8": { kind: "input", description: "Recebimento DOC" },
    "9": { kind: "output", description: "Aluguel" },
  }.freeze

  def kind_text
    if self.is_input?
      return "Entrada"
    else
      return "Saída"
    end
  end

  def is_input?
    self.kind == "input"
  end

  def is_output?
    self.kind == "output"
  end

  def update_store_balance
    if self.is_input?
      balance = self.store.balance + self.amount
    else
      balance = self.store.balance - self.amount
    end
    self.store.update(balance: balance)
  end
end
