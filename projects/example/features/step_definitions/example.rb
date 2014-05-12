Given(/^User visit baidu home page$/) do
  $env.logger.step "Navigating to baidu home page."
  baidu_home_page.visit
end

And(/^Search game using keyword (.*)$/) do |keywords|
  $env.logger.step "Search game using keywords #{keywords} on baidu home page."
  baidu_home_page.search_widget.keywords_input.set keywords
  baidu_home_page.search_widget.search_button.click
end

Then(/^Choose the first result$/) do
  $env.logger.step "Choose the first result on results page."
  baidu_search_result_page.results_widget.first_result.wait_exists.click
end