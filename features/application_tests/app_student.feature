# As a potential student consultant, I want to be able to apply so that I can become a member of 180-Degrees consulting.
Feature: feature apply
  As a potential student consultant
  I want to be able to apply 
  So that I can become a member of 180-Degrees consulting
    
  # checking the route
  # Happy path:
  Scenario: going to application page successfully
    Given I am on the home page
    When I follow "Apply"
    And I follow "Students"
    Then I should be on the application for students page
    
  Scenario: successful application
    Given I am on the application for students page
    When I fill in "Name" with "Rowan"
    And I fill in "Email" with "rowan@funbun.com"
    And I fill in "Major" with "EECS"
    And I fill in "Graduation" with "2016"
    And I press "Submit"
    Then I should see "Thank you for your message. We'll get back to you soon."
