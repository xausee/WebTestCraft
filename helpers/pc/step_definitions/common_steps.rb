Then(/^Current page must be ([A-Za-z\-\s\d]*) page$/) do |page_name|
  wait_page_loaded(page_name)
end



