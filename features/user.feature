Feature: Secuirty and Users
In order for people to be able to register on the site

Scenario: Signing up a new user
	Given I am on the user page
	When I fill in "email" with "robin@test.com"
	And I fill in "password" with "password123"
	And I click "Sign Up"
	Then the first user email should be "robin@test.com" 
	And I should see "Welcome, robin@test.com"