Feature:Test WebTestCraft framework on PC.

  @baidu_search
Scenario: Visit baidu and do a search
  Given User visit baidu home page
  Then Current page must be Baidu Home page
  And Search game using keyword Dota
  Then Current page must be Baidu Search Results page
  Then Choose the first result

  @baidu_search @data_from_csv
  Scenario Outline: Visit baidu and do a search, data from csv
    Given User visit baidu home page
    Then Current page must be <page_name> page
    And Search game using keyword <key_words>
    Then Current page must be <results_page> page
    Then Choose the first result

Examples:
    |page_name|key_words|results_page|
    Data:example.csv

  @google_search
Scenario: Visit google and do a search
  Given User visit google home page
  Then Current page must be Google Home page
  And Search version control tool Git by google
  Then Current page must be Google Search Results page
  Then Choose the first result on google search results page