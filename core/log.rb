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
  end
end