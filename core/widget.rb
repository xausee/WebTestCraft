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
end