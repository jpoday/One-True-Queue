Feature: Sign Up

	As a site visitor
	I want to be able to sign up
	So I can use the service
	
	Scenario: Successfully sign up as a new user
		Given that I'm not signed in
		And I visit the signup page
		When I fill in the user form
		And I press "Sign Up!"
		Then my account should exist
		And I should see "Successfully signed up!"
		
	Scenario: Failed sign up as a new user
		Given that I'm not signed in
		And I visit the signup page
		When I don't fill in the user form
		And I press "Sign Up!"
		Then my account should not exist
		And I should see "Invalid Fields"