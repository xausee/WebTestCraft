module WebTestCraft
  class BaiduSearchResultPage < WebTestCraft::Page
    create_widget_call_method(WebTestCraft::ResultsWidget, :results_widget)
    def url
      'www.baidu.com'
    end
  end
  create_page_call_method(WebTestCraft::BaiduSearchResultPage, :baidu_search_result_page)
end