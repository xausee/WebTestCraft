module WebTestCraft

  def is_registered_page_type?(page_type)
    type = Pages.all.find { |page| page == page_type }
    type = Pages.all.find { |page| page == eval("WebTestCraft::#{page_type}") } if !type
    type.nil? ? false : true
  rescue NameError
    return false
  end

  def determine_page_type(page_name)
    page_class = page_name.to_class_name
    if !is_registered_page_type?(page_class)
      page_class << "Page"
      if !is_registered_page_type?(page_class)
        raise "Passed page type is not registered in WebTestCraft Pages repository: '#{page_name}'"
      end
    end
    return WebTestCraft.const_get("#{page_class}")
  end

  def wait_page_loaded(page_name)
    page_class = determine_page_type(page_name)
    page_class.wait_until_loaded(@browser, 30)
  end

  def save_screenshot(screenshot_name)
    $env.browser.screenshot.save(screenshot_name)
  end

end