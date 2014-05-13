$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'cucumber'
require 'environment'

$env = WebTestCraft::Environment.new

World(WebTestCraft)

Before do |scenario|
  $env.before scenario
  @browser = $env.browser
end

After do |scenario|
  $env.logger.info "End Scenario: #{scenario.name}"
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot_name = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    $env.logger.save_screenshot(screenshot_name)
  end
end

# uncomment this if need to save pages after every step.
# AfterStep do |scenario|
#   Dir::mkdir('screenshots') if not File.directory?('screenshots')
#   @step ||= 0
#   @steps ||= scenario.steps.to_a
#   screenshot_name = "./screenshots/step_#{@steps[@step].name  .gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
#   $env.logger.save_screenshot(screenshot_name)
#   @step += 1
# end

at_exit do
  $env.teardown
end