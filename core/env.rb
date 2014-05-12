$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'cucumber'
require 'Environment'

$env = WebTestCraft::Env.new

World(WebTestCraft)

Before do |scenario|
  $env.before scenario
  @browser = $env.browser
end

at_exit do
  $env.teardown
end