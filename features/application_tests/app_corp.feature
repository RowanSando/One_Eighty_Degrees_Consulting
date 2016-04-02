# As a potential corporate sponsor, I want to be able to apply so that I can get connected with 180-Degrees.
Feature: feature apply
  As a potential corporate sponsor
  I want to be able to apply 
  So that I can get connected with 180 Degrees Consulting
    
  # checking the route
  # Happy path:
  Scenario: going to application page successfully
    Given I am on the home page
    When I follow "Apply"
    And I follow "Sponsors"
    Then I should be on the application for sponsors page
    
  Scenario: successful application
    Given I am on the application for sponsors page
    When I fill in "Name" with "IBM"
    And I fill in "Email" with "ibm@ibm.com"
    And I fill in "Info" with "cs169"
    And I press "Submit"
    Then I should see "Thank you for your message. We'll get back to you soon."
