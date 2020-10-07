class Transaction::ApplicationJob < ActiveJob::Base
  self.queue_adapter = :sidekiq
  queue_as :transaction
end
