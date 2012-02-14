Feature: Sign in and out

	As a user with an account
	I want to be able to sign in and out
	So I can get access to information
	
	Background:
		Given that I'm a user
	
	Scenario: successful sign in
		When I'm signed in
		Then I should see "Successfully signed in!"
		
	Scenario: failed sign in
		When I sign in without filling in the form
		Then I should see "Email or password was invalid"
	
	Scenario: successful sign out
		Given that I'm signed in
		When I visit the sign out link
		Then I should see "Successfully signed out!"