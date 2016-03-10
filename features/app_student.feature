# As a potential student consultant, I want to be able to apply so that I can become a member of 180-Degrees consulting.
Feature: feature apply
  As a potential student consultant
  I want to be able to apply 
  So that I can become a member of 180-Degrees consulting
    
  # checking the route
  # Happy path:
  Scenario: going to application page successfully
    Given I am on the home page
    When I follow "Applications"
    And I follow "Students"
    Then I should be on the application for students page
    
  Scenario: successful application
    Given I am on the application for students page
    When I fill in "Name" with "Rowan"
    And I fill in "Email" with "rowan@funbun.com"
    And I press "Send message"
    Then I should see "Thank you for your message. We'll get back to you soon."

  # Sad path:
  Scenario: failed application
    Given I am on the application for students page
    When I fill in "Name" with "Rowan"
    And I press "Send message"
    Then I should see "can't be blank"