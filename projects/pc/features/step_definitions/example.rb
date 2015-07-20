Given(/^User visit baidu home page$/) do
  $env.logger.step "Navigating to baidu home page."
  baidu_home_page.visit
end

And(/^Search game using keyword (.*)$/) do |keywords|
  $env.logger.step "Search game using keywords #{keywords} on baidu home page."
  hp = baidu_home_page
  hp.baidu_search_widget.keywords_input.set keywords
  hp.baidu_search_widget.search_button.click
end

Then(/^Choose the first result$/) do
  $env.logger.step "Choose the first result on results page."
  baidu_search_result_page.baidu_results_widget.first_result.wait_exists.click
end

Given(/^User visit google home page$/) do
  $env.logger.step "Navigating to google home page."
  google_home_page.visit
end

And(/^Search version control tool (.*) by google$/) do |keywords|
  $env.logger.step "Search game using keywords #{keywords} on google home page."
  hp = google_home_page
  hp.google_search_widget.keywords_input.set keywords
  hp.google_search_widget.search_button.click
end

Then(/^Choose the first result on google search results page$/) do
  $env.logger.step "Choose the first result on google search results page."
  google_search_results_page.google_search_results_widget.first_result_link.wait_exists.click
end