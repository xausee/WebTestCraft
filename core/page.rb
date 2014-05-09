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

    def title
      layer.title
    end

    def url
      raise 'you must define url in your page class.'
    end

    def self.page_id
      raise 'you must define page id in your page class.'
    end

    # DODO finish this function
    def self.is_current_page?(browser, pageid_current=nil)
      # pageid_current ||= Class.new.extend(WebTestCraft).current_pageid(browser)
      #
      # if page_id.class == Regexp
      #   pageid_current =~ page_id
      # else
      #   pageid_current == page_id
      # end
      browser.div(:id => "wrapper_wrapper").div(:id => "content_left").exists?
    end

    def self.wait_until_loaded(browser, timeout=60)
      $env.logger.info "Waiting for the #{self} page to load, Timeout: #{timeout} seconds."
      begin
        browser.wait_until(timeout) { is_current_page?(browser) }
      rescue Watir::Wait::TimeoutError
        raise Watir::Wait::TimeoutError.new(timeout), %Q{Timed out (#{timeout} seconds) waiting for page to load.
        Expected page: #{self}, page_id: #{page_id}

      }
        #Current page: page_id: #{Class.new.extend(Expedia).current_pageid(browser)}, URL = '#{browser.url}'.
      end
    end

    def visit
      @browser.goto url
    end

  end

  class Pages

    def self.register_page(class_name, caller_method)
      if @pages == nil
        @pages = Array.new
      end
      @pages << class_name
      WebTestCraft.create_page_call_method(class_name, caller_method)
    end

    def self.all
      @pages
    end

  end

end