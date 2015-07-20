module WebTestCraft
  class BaiduHomePage < Page
    Widgets.register_widget(WebTestCraft::BaiduSearchWidget, :baidu_search_widget)
    def url
      'www.baidu.com'
    end

    def self.page_id
      #id="fm"
      "form"
    end

    def page_mark
      layer.form(:id => "form")
    end

    def self.page_mark_value
      "form"
    end

  end
  Pages.register_page(WebTestCraft::BaiduHomePage, :baidu_home_page)
end