module WebTestCraft
  class GoogleSearchResultsPage < Page
    Widgets.register_widget(WebTestCraft::GoogleSearchResultsWidget, :google_search_results_widget)
    def url
      'www.google.com'
    end

    def page_mark
      layer.div(:class => "srg")
    end

    def self.page_mark_value
      "srg"
    end

  end
  Pages.register_page(WebTestCraft::GoogleSearchResultsPage, :google_search_results_page)
end