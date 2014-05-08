module WebTestCraft
  class BaiduSearchResultsPage < WebTestCraft::Page
    Widgets.register_widget(WebTestCraft::ResultsWidget, :results_widget)
    def url
      'www.baidu.com'
    end

    def self.page_id
      #layer.div(:class => "content_left").attribute_value("class")
      "content_left"
    end
  end
  Pages.register_page(WebTestCraft::BaiduSearchResultsPage, :baidu_search_result_page)
end