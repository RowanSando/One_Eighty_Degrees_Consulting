# As a potential student consultant, I want to be able to apply so that I can become a member of 180-Degrees consulting.
Feature: feature apply
  As a potential student consultant
  I want to be able to apply 
  So that I can become a member of 180-Degrees consulting
    
  # checking the route
  # Happy path:
  Scenario: going to application page successfully
    Given I am on the home page
    And I follow the application for students page
    Then I should be on the application for students page
    And I fill in name with "Rowan"
    And I fill in email with "rowan@funbun.com"
    And I press submit
    Then I should see "Application Receieved"

  # Sad path:
  Scenario: failed application
    Given I am on the home page
    And I follow the application for students page
    Then I should be on the application for students page
    And I fill in name with "Rowan"
    And I press submit
    Then I should see "Email required!"
