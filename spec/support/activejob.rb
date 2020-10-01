require 'sidekiq/testing'

RSpec.configure do |config|
  config.include ActiveJob::TestHelper
  config.before(:all) do
    Sidekiq::Testing.fake!
  end
  config.before(:each) do
    Sidekiq::Worker.clear_all
  end
end