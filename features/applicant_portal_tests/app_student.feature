# As a potential student consultant, I want to be able to apply so that I can become a member of 180-Degrees consulting.
Feature: feature apply
  As a potential student consultant
  I want to be able to apply 
  So that I can become a member of 180-Degrees consulting

  Background:
    # Given I am not logged in
    Given the following users exist:
    | email                       | password    | member_type |
    | user1@berkeley.edu          | 12345678         | appplicant  |

  # checking the route
  
  Scenario: going to log in page successfully if not logged in
    Given I am on the home page
    When I follow "Apply"
    And I follow "STUDENTS"
    Then I should be on the new user session page

  
  Scenario: going to application page successfully once logged in
    Given I am on the new user session page
    When I fill in "Email" with "user1@berkeley.edu"
    And I fill in "Password" with "12345678"
    And I press "Log in"
    And I follow "Apply"
    And I follow "STUDENTS"
    Then I should be on the application for studentapplications page
    
      # Happy path:

  Scenario: successful application
    Given I am on the new user session page
    When I fill in "Email" with "user1@berkeley.edu"
    And I fill in "Password" with "12345678"
    And I press "Log in"
    And I am on the application for studentapplications page
    And I fill in "Major" with "EECS"
    And I fill in "Graduation" with "2016"
    And I fill in "Info" with "info"
    And I fill in "Essay" with "essay"
    And I press "Submit"
    Then I should see "Thank you for your message. We'll get back to you soon."
    
  #sad path:
  Scenario: unsuccessful application
    Given I am on the new user session page
    When I fill in "Email" with "user1@berkeley.edu"
    And I fill in "Password" with "12345678"
    And I press "Log in"
    And I am on the application for studentapplications page
    And I press "Submit"
    Then I should see "You are missing required fields"
    
  Scenario: the default pending status
    Given I am on the new user session page
    When I fill in "Email" with "user1@berkeley.edu"
    And I fill in "Password" with "12345678"
    And I press "Log in"
    And I am on the application for studentapplications page
    And I fill in "Major" with "EECS"
    And I fill in "Graduation" with "2016"
    And I fill in "Info" with "info"
    And I fill in "Essay" with "essay"
    And I press "Submit"
    And I follow "View My Application"
    Then I should see "We are presently in the process of reviewing."
    