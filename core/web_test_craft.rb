require 'browser'
require 'log'

module WebTestCraft

  class Env
    attr_accessor :browser

    attr_accessor :logger

    def initialize
      @browser =  Browser.start
      @logger = Logger
    end

    def before scenario
      @logger.text ""
      @logger.text scenario.name
      scenario.steps.each do |step|
        @logger.text step.name
      end
      @logger.text ""
    end

    def teardown
      if ENV['DEBUG'] == "ON" || ENV['DEBUG'] == "on"
        @logger.info "Debug model is on, not close the browser."
      else
        @logger.info "close browser..."
        @browser.close
      end
    end
  end
end
