module WebTestCraft
  class Logger

    def initialize

    end

    def self.text message
      puts message
    end

    def self.step message
      puts "[STEP]: #{message}"
    end

    def self.info message
      puts "[INFO]: #{message}"
    end

    def self.warning message
      puts "[WARNING]: #{message}"
    end

    def self.error message
     puts "[ERROR]: #{message}"
    end

    def self.save_screenshot(screenshot_name, message = "")
      puts "[SCREENSHOT]:  Save screenshot, file name  is #{screenshot_name}. #{message}"
      $env.browser.screenshot.save(screenshot_name)
    end
  end
end