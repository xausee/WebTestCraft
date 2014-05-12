$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require "log"

module WebTestCraft
  class Browser
    attr_accessor :browser

    def self.start type = 'FIREFOX'
      unless ENV['BROWSER'].nil?
        type = ENV['BROWSER']
      end

      @browser = case type.upcase
                   when 'IE','ie'
                     IE.start
                   when 'FIREFOX','firefox'
                     Firefox.start
                   when 'CHROME','chrome'
                     Chrome.start
                   else
                     raise 'unsupported browser type.'
                 end
    end

    class IE
      def self.start
        require 'watir'
        ENV['PATH'] = File.expand_path File.join(File.dirname(__FILE__), '..', 'driver')
        Logger.info "Launching Internet Explorer..."
        Watir::Browser.new :ie
      end
    end

    class Firefox
      def self.start
        require 'watir-webdriver'
        download_directory = "#{Dir.pwd}/downloads"
        download_directory.gsub!('/', '\\')  if Selenium::WebDriver::Platform.windows?

        profile = Selenium::WebDriver::Firefox::Profile.new
        profile['browser.download.folderList'] = 2 # custom location
        profile['browser.download.dir'] = download_directory
        profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv,application/pdf'
        Logger.info "Launching Firefox..."
        Watir::Browser.new :firefox, :profile => profile
      end
    end

    class Chrome
      def self.start
        require 'watir-webdriver'
        ENV['PATH'] = File.expand_path File.join(File.dirname(__FILE__), '..', 'driver')
        http_client = Selenium::WebDriver::Remote::Http::Default.new
        http_client.timeout = 120
        download_directory = "#{Dir.pwd}/downloads"
        download_directory.gsub!('/', '\\') if  Selenium::WebDriver::Platform.windows?
        args = %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-logging --no-proxy-server]
        prefs = {'download' => {'default_directory' => download_directory, 'prompt_for_download' => false}}
        caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {'args' => args, 'prefs' => prefs})
        Logger.info "Launching Chrome..."
        Watir::Browser.new(:chrome, :http_client => http_client, :desired_capabilities => caps)
      end
    end
  end
end