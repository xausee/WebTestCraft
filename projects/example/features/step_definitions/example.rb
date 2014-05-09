Given(/^User visit baidu home page$/) do
  baidu_home_page.visit
end

And(/^Search game using keyword Dota$/) do
  baidu_home_page.search_widget.keywords_input.set 'Dota'
  baidu_home_page.search_widget.search_button.click
end

Then(/^Choose the first result$/) do
  baidu_search_result_page.results_widget.first_result.wait_exists.click
end