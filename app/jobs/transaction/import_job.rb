class Transaction::ImportJob < Transaction::ApplicationJob
  def perform(line)
    data = CnabService.build(line)

    Transaction.create(data)
  end
end
