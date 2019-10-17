require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PagnetCnab
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'Brasilia'
    config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      g.system_tests = nil
      g.test_framework :rspec
      g.integration_tool :rspec
      g.view_specs false
      g.controller_specs false
      g.helper_specs false
      g.request_specs false
    end
  end
end
