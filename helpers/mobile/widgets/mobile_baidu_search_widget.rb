module WebTestCraft
  class MobileBaiduSearchWidget < WebTestCraft::Widget

    def layer
      @container.div(:id => 'page')
    end

    def keywords_input
      layer.text_field(:id => 'index-kw')
    end

    def search_button
      layer.button(:id => 'index-bn')
    end

  end
  WebTestCraft::Page.create_widget_call_method(WebTestCraft::MobileBaiduSearchWidget, :mobile_baidu_search_widget)
end