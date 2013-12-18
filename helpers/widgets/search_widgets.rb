module WebTestCraft
  class SearchWidget < WebTestCraft::Widget

    def layer
      @container.div(:id => 'fm')
    end

    def keywords_input
      layer.text_field(:id => 'kw')
    end

    def search_button
      layer.button(:id => 'su')
    end

  end
  WebTestCraft::Page.create_widget_call_method(WebTestCraft::SearchWidget, :search_widget)
end