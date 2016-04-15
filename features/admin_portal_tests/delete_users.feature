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
    | user1@berkeley.edu          | 123         | applicant  |
    | user2@berkeley.edu          | 123         | applicant   |
    | user3@berkeley.edu          | 123         | applicant   |
  
  Scenario: bulk deleting users
    Given I am on the admin page
    And I follow "Edit Users"
    
    Then I should be on the Edit Users page
    And I should see the member_type for "user1@berkeley.edu" as "Applicant"
    And I should see the member_type for "user2@berkeley.edu" as "Applicant"
    And I should see the member_type for "user3@berkeley.edu" as "Applicant"
    And I should see the member_type for "admin@berkeley.edu" as "Admin"
    
    And I select checkbox for "user1@berkeley.edu"
    And I select checkbox for "user2@berkeley.edu"
    And I press "Delete Users"
    
    And I should not see "user1@berkeley.edu"
    And I should not see "user2@berkeley.edu"
    And I should see the member_type for "user3@berkeley.edu" as "Applicant"
    And I should see the member_type for "admin@berkeley.edu" as "Admin"
    
    And I follow "Admin"
    And I follow "Applications"
    Then I should be on the Applications page
    And I should not see "user1@berkeley.edu"
    And I should not see "user2@berkeley.edu"