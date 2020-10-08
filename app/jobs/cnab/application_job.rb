class Cnab::ApplicationJob < ActiveJob::Base
  self.queue_adapter = :sidekiq
  queue_as :imports
end
