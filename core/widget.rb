require "page"

module WebTestCraft

  class Widget

    attr_accessor  :container

    def initialize browser
      @container = browser
    end

    def layer
      @layer ||= nil
      raise "Called abstract method: layer of class #{self.class}"
    end
  end

  class Widgets

    def self.register_widget(class_name, caller_method)
      if @widgets == nil
        @widgets = Array.new
      end
      @widgets << class_name
      WebTestCraft::Page.create_widget_call_method(class_name, caller_method)
    end

  end
end