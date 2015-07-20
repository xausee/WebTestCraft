module WebTestCraft
  class BaiduSearchWidget < WebTestCraft::Widget

    def layer
      @container.form(:id => 'form')
    end

    def keywords_input
      layer.text_field(:id => 'kw')
    end

    def search_button
      layer.button(:id => 'su')
    end

  end
  WebTestCraft::Page.create_widget_call_method(WebTestCraft::BaiduSearchWidget, :baidu_search_widget)
end