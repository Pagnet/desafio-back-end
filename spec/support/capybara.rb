# frozen_string_literal: true

require 'selenium/webdriver'

Capybara.register_driver :selenium_chrome_in_container do |app|
  Capybara::Selenium::Driver.new app,
                                 browser: :remote,
                                 url: ENV['SELENIUM_DRIVER_URL'],
                                 desired_capabilities: :chrome
end

Capybara.register_driver :headless_selenium_chrome_in_container do |app|
  Capybara::Selenium::Driver.new app,
                                 browser: :remote,
                                 url: ENV['SELENIUM_DRIVER_URL'],
                                 desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                                   chromeOptions: { args: %w[headless disable-gpu] }
                                 )
end
