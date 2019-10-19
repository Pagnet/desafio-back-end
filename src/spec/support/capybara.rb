require 'capybara/rspec'
require 'selenium-webdriver'

@chrome_options = { args: ["window-size=1440,900"] }

def register_driver_local
  Capybara.register_driver :local do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: @chrome_options)
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
  end
  Capybara.javascript_driver = :local
end


def register_driver_headless
  Capybara.register_driver :headless do |app|
    @chrome_options[:args] << 'headless'
    @chrome_options[:args] << 'no-sandbox'
    @chrome_options[:args] << 'disable-gpu'
    options = Selenium::WebDriver::Chrome::Options.new(@chrome_options)
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
  Capybara.javascript_driver = :headless
end


case ENV["BROWSER_MODE"]
when 'headless' then register_driver_headless
when 'local' then register_driver_local
else register_driver_headless
end


Capybara.default_max_wait_time = 10
Capybara.server = :puma, {Silent: true}
Capybara.ignore_hidden_elements = false
