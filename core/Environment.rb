require 'browser'
require 'log'

module WebTestCraft

  class Environment
    attr_accessor :browser

    attr_accessor :logger

    def initialize
      @logger = Logger
      print_envs
      @browser =  Browser.start
    end

    def print_envs
      @logger.text "Environment Variables:
                      BROWSER = #{ENV['BROWSER']}
                      DEBUG   = #{ENV['DEBUG']}"
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
