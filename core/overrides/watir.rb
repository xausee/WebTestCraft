module Watir

  class Element
    def wait_present(timeout = 15, element = self)
      $env.logger.info("Wait #{timeout} seconds for the element to be present")
      timeout.times do |t|
        unless element.exists?
          sleep(1)
        else
          $env.logger.info("Element is present after waiting #{t} seconds")
          return element
        end
      end

      if !element.exists?
        $env.logger.warning("Failed to wait #{timeout} seconds for the element to be present")
        raise "Failed to wait #{timeout} seconds for the element to be present"
      end
    end

    def wait_exists(timeout = 15, element = self)
      if timeout < 0
        #$env.logger.warning("Failed to wait #{timeout} seconds for the element to be present")
        raise "Failed to wait #{timeout} seconds for the element to be present"
        return element
      end

      unless element.exists?
        wait_exists(timeout - 1, self)
        sleep(1)
      end
      return element
    end
  end
end