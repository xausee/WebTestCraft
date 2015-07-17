module WebTestCraft
  class MobileBaiduSearchResultsPage < WebTestCraft::Page
    Widgets.register_widget(WebTestCraft::MobileBaiduResultsWidget, :mobile_baidu_results_widget)
    def url
      'wap.baidu.com'
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
  Pages.register_page(WebTestCraft::MobileBaiduSearchResultsPage, :mobile_baidu_search_results_page)
end