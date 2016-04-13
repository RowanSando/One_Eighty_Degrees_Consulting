# As an admin, 
# I want to be able to delete a user, 
# so that they can no longer use the website.

Feature: delete users
  As an admin,
  I want to be able to delete a user,
  So that they can no longer use the website.

  Background:
    # Given I am not logged in
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | user1@berkeley.edu          | 123         | appplicant  |
    | user2@berkeley.edu          | 123         | applicant   |
    | user3@berkeley.edu          | 123         | applicant   |
  
  Scenario: deleting bulk users
    Given I am on the admin page
    And I follow "Edit Users"
    
    And I should see the status for "user1@berkeley.edu" as "Applicant"
    And I should see the status for "user2@berkeley.edu" as "Applicant"
    And I should see the status for "user3@berkeley.edu" as "Applicant"
    And I should see the status for "admin@berkeley.edu" as "Admin"
    
    And I select checkbox for "user1@berkeley.edu"
    And I select checkbox for "user2@berkeley.edu"
    And I press "Delete All"
    
    Then I should see "Updated Successfully"
    And I should not see the status for "user1@berkeley.edu" as "Applicant"
    And I should not see the status for "user2@berkeley.edu" as "Applicant"
    And I should see the status for "user3@berkeley.edu" as "Applicant"
    And I should see the status for "admin@berkeley.edu" as "Admin"
