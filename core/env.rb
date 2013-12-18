$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
puts 'test start...'

require 'cucumber'
require 'browser'

World(WebTestCraft)

Before do |scenario|
  @browser =  WebTestCraft::Browser._start('chrome')
end