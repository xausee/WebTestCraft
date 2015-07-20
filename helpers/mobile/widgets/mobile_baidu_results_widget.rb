module WebTestCraft
  class MobileBaiduResultsWidget < WebTestCraft::Widget

    def layer
      @container.div(:id => 'page-bd')
    end

    def text_result_container
      layer.div(:id =>  'results')
    end

    def first_result
      text_result_container.div(:class => /result/).a
    end

  end
  WebTestCraft::Page.create_widget_call_method(WebTestCraft::MobileBaiduResultsWidget, :mobile_baidu_results_widget)
end