Feature:Test WebTestCraft framework on PC.

  @baidu_search
Scenario: Visit baidu and do a search
  Given User visit baidu home page
  Then Current page must be Baidu Home page
  And Search game using keyword Dota
  Then Current page must be Baidu Search Results page
  Then Choose the first result

  @google_search
Scenario: Visit google and do a search
  Given User visit google home page
  Then Current page must be Google Home page
  And Search version control tool Git by google
  Then Current page must be Google Search Results page
  Then Choose the first result on google search results page