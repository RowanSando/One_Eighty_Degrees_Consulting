# As a potential corporate sponsor, I want to be able to apply so that I can get connected with 180-Degrees.
Feature: feature apply
  As a potential corporate sponsor
  I want to be able to apply 
  So that I can get connected with 180 Degrees Consulting
    
  # checking the route
  # Happy path:
  Scenario: going to application page successfully
    Given I am on the home page
    When I follow "Applications"
    And I follow "Sponsors"
    Then I should be on the application for sponsors page
    
  Scenario: successful application
    Given I am on the application for sponsors page
    When I fill in "Name" with "IBM"
    And I fill in "Email" with "ibm@ibm.com"
    And I press "Send message"
    Then I should see "Thank you for your message. We'll get back to you soon."

  # Sad path:
  Scenario: failed application
    Given I am on the application for sponsors page
    When I fill in "Name" with "IBM"
    And I press "Send message"
    Then I should see "can't be blank"