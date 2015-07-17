module WebTestCraft
  class BaiduResultsWidget < WebTestCraft::Widget

    def layer
      @container.div(:id => 'container')
    end

    def text_result_container
      layer.div(:id =>  'content_left')
    end

    def first_result
      text_result_container.div(:id => 1.to_s).a(:class => 'favurl')
    end

  end
  WebTestCraft::Page.create_widget_call_method(WebTestCraft::BaiduResultsWidget, :baidu_results_widget)
end