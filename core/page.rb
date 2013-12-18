module WebTestCraft

  def self.create_page_call_method(class_name, caller_method)
    define_method("#{caller_method}") do
      class_name.new(@browser)
    end
  end

  class Page

    def self.create_widget_call_method(class_name, caller_method)
      define_method("#{caller_method}") do
        class_name.new(@browser)
      end
    end

    def initialize browser
      @browser = browser
    end

    def layer
      @browser
    end

    def url
      raise 'you must define url in your page class.'
    end

    def visit
      @browser.goto url
    end
  end

end