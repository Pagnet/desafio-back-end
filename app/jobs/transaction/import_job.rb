class Transaction::ImportJob < Transaction::ApplicationJob
  def perform(line)
    CnabService.build(line)
  end
end
