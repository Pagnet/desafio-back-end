class Transaction::ImportJob < Transaction::ApplicationJob
  def perform(line)
    data = CnabService.build(line)

    AccountTransaction.create(data)
  end
end
