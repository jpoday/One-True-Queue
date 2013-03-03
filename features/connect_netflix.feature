# Feature: Connect Netflix
# 
# 	As a site visitor
# 	I authorize OneTrueQueue to access my account
# 	So I can add movies to my queues
# 	
# 	Background: 
# 		Given that I'm a user
# 		And I'm signed in
# 	
# 	@javascript
# 	Scenario: Successfully authorize
# 		Given I'm on the oauth_consumers page
# 		When I follow "Netflix"
# 		And I authorize the app
# 		Then I should see "Netflix was successfully connected to your account"