module WebTestCraft
  class Browser
    attr_accessor :browser

    def initialize(type = 'ie')
      unless ENV['BROWSER'].nil?
        _start ENV['BROWSER']
      else
        _start type
      end
    end

    def self._start (b)
      case b.upcase
        when 'IE'
          require 'watir'
          ENV['PATH'] = File.expand_path File.join(File.dirname(__FILE__), '..', 'driver')
          @browser = Watir::Browser.new :ie
        when 'FIREFOX'
          require 'watir-webdriver'
          download_directory = "#{Dir.pwd}/downloads"
          download_directory.gsub!('/', '\\')  if Selenium::WebDriver::Platform.windows?

          profile = Selenium::WebDriver::Firefox::Profile.new
          profile['browser.download.folderList'] = 2 # custom location
          profile['browser.download.dir'] = download_directory
          profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv,application/pdf'

          @browser = Watir::Browser.new :firefox, :profile => profile
        when 'CHROME'
          require 'watir-webdriver'
          ENV['PATH'] = File.expand_path File.join(File.dirname(__FILE__), '..', 'driver')
          http_client = Selenium::WebDriver::Remote::Http::Default.new
          http_client.timeout = 120
          download_directory = "#{Dir.pwd}/downloads"
          download_directory.gsub!('/', '\\') if  Selenium::WebDriver::Platform.windows?
          args = %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-logging --no-proxy-server]
          prefs = {'download' => {'default_directory' => download_directory, 'prompt_for_download' => false}}
          caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {'args' => args, 'prefs' => prefs})
          @browser = Watir::Browser.new(:chrome, :http_client => http_client, :desired_capabilities => caps)
        else
          raise 'unsupported browser type.'
      end
    end
  end
end