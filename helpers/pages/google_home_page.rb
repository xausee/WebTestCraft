module WebTestCraft
  class GoogleHomePage < Page
    Widgets.register_widget(WebTestCraft::GoogleSearchWidget, :google_search_widget)
    def url
      'www.google.com'
    end

    def self.page_id
     # :class => "gbqfba"
      "gbqfba"
    end

    def page_mark
      layer.button(:class => "gbqfba")
    end

    def self.page_mark_value
      "gbqfba"
    end

  end
  Pages.register_page(WebTestCraft::GoogleHomePage, :google_home_page)
end