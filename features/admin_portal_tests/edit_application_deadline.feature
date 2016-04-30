#As an admin, I want to be able to change the application deadline, so users can't apply past the deadline.
Feature: edit deadline
  As an admin,
  I want to be able to change the application deadline,
  so users can't apply past the deadline.
  
  Background:
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    And the deadline is "1/1/2016, 11:59 PM"
    
  Scenario: check deadline
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Set Application Deadline"
    Then I should see "2016-01-01T23:59:00"
    
  Scenario: change deadline
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Set Application Deadline"
    And I fill in date with "2017-1-1-23-59"
    Then I should see "successfully set"
    
    