module WebTestCraft
  class BaiduHomePage < Page
    Widgets.register_widget(WebTestCraft::SearchWidget, :search_widget)
    def url
      'www.baidu.com'
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
  Pages.register_page(WebTestCraft::BaiduHomePage, :baidu_home_page)
end