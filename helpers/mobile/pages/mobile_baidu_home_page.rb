module WebTestCraft
  class MobileBaiduHomePage < Page
    Widgets.register_widget(WebTestCraft::MobileBaiduSearchWidget, :mobile_baidu_search_widget)
    def url
      'http://wap.baidu.com'
    end

    def self.page_id
      #id="fm"
      "index-form"
    end

    def page_mark
      layer.form(:id => "index-form")
    end

    def self.page_mark_value
      "index-form"
    end

  end
  Pages.register_page(WebTestCraft::MobileBaiduHomePage, :mobile_baidu_home_page)
end