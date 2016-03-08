# As a potential corporate sponsor, I want to be able to apply so that I can get connected with 180-Degrees.
Feature: feature apply
  As a potential corporate sponsor
  I want to be able to apply 
  So that I can get connected with 180 Degrees Consulting
    
  # checking the route
  # Happy path:
  Scenario: going to application page successfully
    Given I am on the home page
    And I follow the application for corporate sponsor page
    And I fill in company name with "IBM"
    And I fill in email with "ibm@ibm.com"
    And I press submit
    Then I should see "Application Receieved"

  # Sad path:
  Scenario: failed application
    Given I am on the home page
    And I follow the application for corporate sponsor page
    And I fill in company name with "IBM"
    And I press submit
    Then I should see "Email required!"
