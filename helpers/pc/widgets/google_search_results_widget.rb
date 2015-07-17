module WebTestCraft
  class GoogleSearchResultsWidget < WebTestCraft::Widget

    def layer
      @container.div(:class => 'srg')
    end

    def results
      layer.lis
    end

    def first_result_link
      results[0].a
    end

  end
  WebTestCraft::Page.create_widget_call_method(WebTestCraft::GoogleSearchResultsWidget, :google_search_results_widget)
end