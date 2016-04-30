# As a potential NP client, I want to be able to apply so that I can receive consulting.
Feature: feature apply
  As a potential non-profit client
  I want to be able to apply 
  So that I can receive consulting
    
  # checking the route
  # Happy path:
  Scenario: going to application page successfully
    Given I am on the home page
    When I follow "Apps"
    And I follow "CLIENTS"
    Then I should be on the application for clients page
    
  Scenario: successful application
    Given I am on the application for clients page
    When I fill in "Name" with "UNICEF"
    And I fill in "Email" with "unicef@unicef.com"
    And I fill in "Info" with "cs169"
    And I press "Submit"
    Then I should see "Thank you for your interest. We'll get back to you soon."

