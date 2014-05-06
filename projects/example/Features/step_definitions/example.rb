Given(/^the user visit baidu home page$/) do
  baidu_home_page.visit
end

And(/^search game using keyword Dota$/) do
  baidu_home_page.search_widget.keywords_input.set 'Dota'
  baidu_home_page.search_widget.search_button.click
end

Then(/^get a search result page$/) do
  sleep(5)
  baidu_search_result_page.results_widget.first_result.click
end