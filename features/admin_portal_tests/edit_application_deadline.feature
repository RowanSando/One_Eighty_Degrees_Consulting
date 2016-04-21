#As an admin, I want to be able to change the application deadline, so users can't apply past the deadline.
Feature: edit deadline
  As an admin,
  I want to be able to change the application deadline,
  so users can't apply past the deadline.
  
  Background:
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    
    And the deadline is "2015-1-1"
    
  Scenario: check deadline
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Edit Deadline"
    
    And I should see "2015-1-1"
    
  Scenario: change deadline
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Edit Deadline"
    
    And I fill in "Deadline" with "2016-1-1"
    And I follow "Edit"
    Then I should see "2016-1-1"
    