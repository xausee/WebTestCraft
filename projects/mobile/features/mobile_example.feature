Feature:Test WebTestCraft framework on mobile.

  @baidu_search
  Scenario: Visit baidu on mobile device and do a search
    Given User visit baidu home page
    Then Current page must be Mobile Baidu Home page
    And Search game using keyword Dota
    Then Current page must be Mobile Baidu Search Results page
    Then Choose the first result