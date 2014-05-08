Feature: Bookmark functionality
In order to revist pages
I can save time with bookmark links

Scenario: Viewing home page
	Given I am on the homepage
	Then I should see "Bookmark Manager"


Scenario: Add link
  Given I am on the homepage
  When I fill in "title" with "Makers"
  And I fill in "url" with "http://www.makersacademy.com"
  And I click "add"
  Then I should see "Makers" in a link


 Scenario: Adding links with two tags
 Given I am on the homepage
 When I fill in "title" with "Makers"
 And I fill in "url" with "http://www.makersacademy.com"
 And I fill in "tags" with "codeschool,education"
 And I click "add"
 Then I should see "Makers" in a link
 And I should see "codeschool"
 And I should see "education"
  