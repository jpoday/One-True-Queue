Given /^that I'm a user$/ do
  @user = FactoryGirl.create(:user)
end

Given /I'm signed in/ do
  visit signin_path
  fill_in "Email",    :with => "user@example.com"
  fill_in "Password", :with => "foobarbaz"
  click_button "Sign in"
end

Given /^that I'm not signed in$/ do
  visit signout_path
end

Given /^I visit the signup page$/ do
  visit signup_path
end

When /^I fill in the user form$/ do
  fill_in "user_name",                  :with => "example"
  fill_in "user_email",                 :with => "user@example.com"
  fill_in "user_password",              :with => "foobarbaz"
  fill_in "user_password_confirmation", :with => "foobarbaz"
end

When /^I don't fill in the user form$/ do
  fill_in "user_name",                  :with => ""
  fill_in "user_email",                 :with => ""
  fill_in "user_password",              :with => ""
  fill_in "user_password_confirmation", :with => ""
end

When /^I sign in without filling in the form$/ do
  visit signin_path
  fill_in "Email",    :with => ""
  fill_in "Password", :with => ""
  click_button "Sign in"
end

When /^I visit the sign out link$/ do
  visit signout_path
end

Then /^my account should exist$/ do
  @user = User.find_by_email("user@example.com")
  @user.should_not be_nil
end

Then /^my account should not exist$/ do
  @user = User.find_by_email("user@example.com")
  @user.should be_nil
end