module WebTestCraft
  class SearchWidget < WebTestCraft::Widget

    def layer
      @container.div(:id => 'fm')
    end

    def keywords_input
      layer.text_field(:id => 'kw1')
    end

    def search_button
      layer.button(:id => 'su1')
    end

  end
  WebTestCraft::Page.create_widget_call_method(WebTestCraft::SearchWidget, :search_widget)
end