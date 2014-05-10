Feature: Secuirty and Users
In order for people to be able to register on the site

Scenario: Signing up a new user
	Given I am on the user page
	When I fill in "email" with "robin@test.com"
	And I fill in "password" with "password123"
	And I fill in "password_confirmation" with "password123"
	And I click "Sign Up"
	Then the first user email should be "robin@test.com" 
	And I should see "Welcome, robin@test.com"

Scenario: Cant sign up if passwords dont match
	Given I am on the user page
	When I fill in "email" with "robin@test.com"
	And I fill in "password" with "password123"
	And I fill in "password_confirmation" with "password456"
	And I click "Sign Up"
	Then the first user count should still be zero
	And I should see "Password does not match the confirmation"

Scenario: Registered user can login
	Given I am a registered user with email "robin@test.com", pass "password123"
	And I am on the user login page
	When I fill in the correct login details "robin@test.com", pass "password123"
	Then I should see "Welcome, robin@test.com"
