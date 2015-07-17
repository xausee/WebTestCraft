module WebTestCraft
  class MobileBaiduHomePage < Page
    Widgets.register_widget(WebTestCraft::MobileBaiduSearchWidget, :mobile_baidu_search_widget)
    def url
      'http://wap.baidu.com'
    end

    def visit
      @browser.navigate.to url
    end

    def self.page_id
      #id="fm"
      "fm"
    end

    def page_mark
      layer.form(:id => "form1")
    end

    def self.page_mark_value
      "form1"
    end

  end
  Pages.register_page(WebTestCraft::MobileBaiduHomePage, :mobile_baidu_home_page)
end