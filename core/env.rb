$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'cucumber'
require 'environment'

$env = WebTestCraft::Environment.new

World(WebTestCraft)

Before do |scenario|
  $env.before scenario
  @browser = $env.browser
end

at_exit do
  $env.teardown
end