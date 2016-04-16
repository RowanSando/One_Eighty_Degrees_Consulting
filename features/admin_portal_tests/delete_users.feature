# As an admin, 
# I want to be able to delete a user, 
# so that they no longer are in the user database.

Feature: delete users
  As an admin,
  I want to be able to delete a user,
  So that they no longer are in the user database

  Background:
    # Given I am not logged in
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | user1@berkeley.edu          | password123 | applicant   |
    | user2@berkeley.edu          | password123 | applicant   |
    | user3@berkeley.edu          | password123 | applicant   |
  
  Scenario: bulk deleting users
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Edit Users"
    
    Then I should see "Edit Users"
    And I should see "user1@berkeley.edu" 
    And I should see "user2@berkeley.edu" 
    And I should see "user3@berkeley.edu"
    And I should see "admin@berkeley.edu"
    
    And I select checkbox for "user1@berkeley.edu"
    And I select checkbox for "user2@berkeley.edu"
    And I press "Delete Users"
    
    And I should not see "user1@berkeley.edu"
    And I should not see "user2@berkeley.edu"
    And I should see "user3@berkeley.edu" 
    And I should see "admin@berkeley.edu" 
    
    # And I follow "Admin"
    # And I follow "Applications"
    # Then I should be on the admin viewapps page
    # And I should not see "user1@berkeley.edu"
    # And I should not see "user2@berkeley.edu"