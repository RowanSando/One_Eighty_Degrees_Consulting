# As a visitor, I want to be able to go to the about page, 
# so I can learn more about 180-Degrees Consulting at Berkeley.

Feature: about page
  As a visitor
  I want to be able to go to the about page
  So I can learn more about 180 degrees Consulting at Berkeley

  # Happy path (no sad paths):
  # seeing the header
  Scenario: seeing the about page successfully
    Given I am on the home page
    And I follow the about page
    Then I should see About 180 Degrees at Berkeley
  
  # checking the route
  Scenario: going to about page successfully
    Given I am on the home page
    And I follow the about page
    Then I should be on the about page