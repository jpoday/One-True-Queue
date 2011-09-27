Feature: Layout Links

	As a site owner
	I want to control the display of the navigation links
	So only the appropriate users have access to the resources
	
	Scenario: As a site visitor
		Given I'm on the home page
		Then I should see "Sign Up"
		And I should see "Sign In"
		And I should see "Contact"
	
	Scenario: As a signed in user
		Given that I'm a user
		And that I'm signed in
		And I'm on the home page
		Then I should not see "Sign Up"
		And I should not see "Sign In"
		And I should see "Settings"
		And I should see "Sign Out"