# As an admin, I want to be able to click a link to see all the users, so I can make changes to or delete them.

Feature: edit users page
  As an admin,
  I want to be able to click a link to see all the users,
  so I can make changes to or delete them.
  
  Background:
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | applicant@berkeley.edu      | password123 | applicant   |
    
  Scenario: as an admin, I should be able to make a user an admin
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Edit Users"
    Then I should be on the Edit Users page