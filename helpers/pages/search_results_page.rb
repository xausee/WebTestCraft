module WebTestCraft
  class BaiduSearchResultsPage < WebTestCraft::Page
    Widgets.register_widget(WebTestCraft::ResultsWidget, :results_widget)
    def url
      'www.baidu.com'
    end

    def self.page_id
      #layer.div(:id => "content_left").attribute_value("class")
      "content_left"
    end

    def page_mark
      layer.div(:id => "content_left")
    end

    def self.page_mark_value
      "content_left"
    end

  end
  Pages.register_page(WebTestCraft::BaiduSearchResultsPage, :baidu_search_result_page)
end