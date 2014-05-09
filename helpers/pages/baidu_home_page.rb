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
  end
  Pages.register_page(WebTestCraft::BaiduHomePage, :baidu_home_page)
end