Feature: Bookmark functionality
In order to revist pages
I can save time with bookmark links

Scenario: Viewing home page
	Given I am on the homepage
	Then I should see "Bookmark Manager"


Scenario: Add link
  Given I am on the homepage
  When I fill in "title" with "title_test"
  And I fill in "url" with "http://www.makersacademy.com"
  And I click "add"
  Then I should see "title_test" in a link