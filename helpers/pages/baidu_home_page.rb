module WebTestCraft
  class BaiduHomePage < WebTestCraft::Page
    create_widget_call_method(WebTestCraft::SearchWidget, :search_widget)
    def url
      'www.baidu.com'
    end
  end
  create_page_call_method(WebTestCraft::BaiduHomePage, :baidu_home_page)
end