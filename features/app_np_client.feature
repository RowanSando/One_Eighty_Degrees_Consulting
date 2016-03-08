# As a potential NP client, I want to be able to apply so that I can receive consulting.
Feature: feature apply
  As a potential non-profit client
  I want to be able to apply 
  So that I can receive consulting

  # checking the route
  # Happy path:
  Scenario: going to application page successfully
    Given I am on the home page
    And I follow the application for non-profit orgs page
    And I fill in name with "UNICEF"
    And I fill in email with "unicef@unicef.com"
    And I press submit
    Then I should see "Application Receieved"

  # Sad path:
  Scenario: failed application
    Given I am on the home page
    And I follow the application for non-profit orgs page
    And I fill in name with "UNICEF"
    And I press submit
    Then I should see "Email required!"