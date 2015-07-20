module WebTestCraft
  class MobileBaiduSearchResultsPage < WebTestCraft::Page
    Widgets.register_widget(WebTestCraft::MobileBaiduResultsWidget, :mobile_baidu_results_widget)
    def url
      'http://wap.baidu.com'
    end

    def self.page_id
      #layer.div(:id => "content_left").attribute_value("class")
      "page-bd"
    end

    def page_mark
      layer.div(:id => "page-bd")
    end

    def self.page_mark_value
      "page-bd"
    end

  end
  Pages.register_page(WebTestCraft::MobileBaiduSearchResultsPage, :mobile_baidu_search_results_page)
end