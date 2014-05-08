module WebTestCraft
  class BaiduHomePage < Page
    Widgets.register_widget(WebTestCraft::SearchWidget, :search_widget)
    def url
      'www.baidu.com'
    end
  end
  Pages.register_page(WebTestCraft::BaiduHomePage, :baidu_home_page)
end