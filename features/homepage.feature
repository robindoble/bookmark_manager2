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
  
 Scenario: Filtering links by tags
 Given there are the following links:
 |title					|url													|tags								|
 |makersacademy	|http://makersacademy.com			|education					|				   		
 |google				|http://google.com						|search							|				   		
 |bing					|http://bing.com							|search							|
 |live					|http://live.com							|mailserver					|				
 When I press the link "search"
 Then I should see only those links
 