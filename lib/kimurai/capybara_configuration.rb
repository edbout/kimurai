require 'capybara'

Capybara.configure do |config|
  config.run_server = false
  config.default_selector = :xpath
  config.save_path = "tmp"
  config.default_max_wait_time = 10
  config.ignore_hidden_elements = false
  config.threadsafe = true
end

=begin
# added for heroku

chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)
chrome_opts = chrome_bin ? { "chromeOptions" => { "binary" => chrome_bin } } : {}

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(
     app,
     browser: :chrome,
     desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(chrome_opts)
  )
end

Capybara.javascript_driver = :chrome
=end