module WebTestCraft
  class GoogleSearchWidget < WebTestCraft::Widget

    def layer
      @container.form(:id => 'gbqf')
    end

    def keywords_input
      layer.text_field(:id => 'gbqfq')
    end

    # def search_button
    #   layer.button(:id => 'gbqfba')
    # end

    def search_button
      layer.button(:id => 'gbqfb')
    end

  end
  WebTestCraft::Page.create_widget_call_method(WebTestCraft::GoogleSearchWidget, :google_search_widget)
end