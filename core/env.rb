$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'cucumber'
require 'web_test_craft'
require 'browser'

World(WebTestCraft)

Before do |scenario|
  @browser =  WebTestCraft::Browser.start('chrome')
end