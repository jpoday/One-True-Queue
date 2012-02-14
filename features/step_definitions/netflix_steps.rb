Given /^I'm on the oauth_consumers page$/ do
  visit oauth_consumers_path
end

When /^I authorize the app$/ do
  fill_in "login", :with => "joseph.oday@gmail.com"
  fill_in "password", :with => "nfewbt701Ciast"
  page.evaluate_script("document.forms[0].submit()")
  page.wait_until(10) { page.has_css?("#flash_notice", :visible => true) }
end

When /^I follow "([^"]*)"$/ do |link|
  click_link "#{link}"
end