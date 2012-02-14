Given /^I'm on the home page$/ do
  visit root_path
end

Then /^I should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should_not have_content(text)
  else
    assert page.has_no_content?(text)
  end
end

When /^I press "([^"]*)"$/ do |button|
  click_button "#{button}"
end