# As an admin, I want to be able to change a user's access to admin, so that other people have admin access to the website.

Feature: sending status email
  As an admin,
  I want to be able to change a user's access to admin,
  so that other people have admin access to the website.
  
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
    And I select checkbox for "applicant@berkeley.edu"
    And I press "Give Admin"
    Then I should see "Updated Successfully"
    
        