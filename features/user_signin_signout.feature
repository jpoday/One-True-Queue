Feature: Sign in and out

	As a user with an account
	I want to be able to sign in and out
	So I can get access to information
	
	Scenario: successful sign in
		Given that I'm a user
		When I sign in
		Then I should see "Successfully signed in!"
		
	Scenario: failed sign in
		Given that I'm a user
		When I sign in without filling in the form
		Then I should see "Email or password was invalid"
	
	Scenario: successful sign out
		Given that I'm a user
		And that I'm signed in
		When I visit the sign out link
		Then I should see "Successfully signed out!"