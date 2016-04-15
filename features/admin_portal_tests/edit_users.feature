# As an admin, I want to be able to click a link to see all the users, so I can add or remove users as admins.

Feature: edit users page
  As an admin,
  I want to be able to click a link to see all the users,
  so I can add or remove users as admins.
  
  Background:
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | admin1@berkeley.edu         | password123 | admin       |
    | applicant@berkeley.edu      | password123 | applicant   |
    
# giving admin access
  Scenario: as an admin, I should be able to make a user an admin
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Edit Users"
    Then I should be on the Edit Users page
    
    And I should see the member_type for "admin@berkeley.edu" as "admin"
    And I should see the member_type for "admin1@berkeley.edu" as "admin"
    And I should see the member_type for "applicant@berkeley.edu" as "applicant"

    And I select checkbox for "applicant@berkeley.edu"
    And I press "Give Admin"
    And I should see the member_type for "applicant@berkeley.edu" as "Admin"
    
    And I follow "Logout"
    And I follow "Log in"
    And I fill in "Email" with "applicant@berkeley.edu"
    And I press "Log in"
    And I should see "Admin"

# removing admin access
  Scenario: as an admin, I should be able to make a user an admin
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin1@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Edit Users"
    Then I should be on the Edit Users page
    
    And I select checkbox for "admin@berkeley.edu"
    And I press "Remove Admin"
    And I should not see the member_type for "admin@berkeley.edu" as "Admin"
    
    And I follow "Logout"
    And I follow "Log in"
    And I fill in "Email" with "admin@berkeley.edu"
    And I press "Log in"
    And I should not see "Admin"