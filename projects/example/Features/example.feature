Feature:Test WebTestCraft framework.

Scenario: Visit baidu and do a search
  Given the user visit baidu home page
  And search game using keyword Dota
  Then get a search result page
