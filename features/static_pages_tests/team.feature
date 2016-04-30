# As a visitor, I want to be able to go to the team page, 
# so I can see the team of 180-Degrees Consulting at Berkeley.

Feature: team page
  As a visitor
  I want to be able to go to the team page
  So I can see the team of 180 degrees Consulting at Berkeley

  # Happy path (no sad paths):
  # seeing the header
  Scenario: seeing the team page successfully
    Given I am on the home page
    And I follow "Teams"
    Then I should see "Teams"
  
  # checking the route
  Scenario: going to team page successfully
    Given I am on the home page
    And I follow "Teams"
    Then I should be on the team page