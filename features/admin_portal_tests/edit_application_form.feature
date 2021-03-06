#As an admin, I want to be able to change the essay questions in the application form, so that I can get the appropriate info from applicants.

Feature: edit application form
  As an admin,
  I want to be able to change the essay questions in the application form,
  so that I can get the appropriate info from applicants.
  
  Background:
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | applicant@berkeley.edu      | password123 | applicant   |  
    
  Scenario: successfully edit essay questions
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    
    And I follow "Edit Essay Prompts"
    And I fill in "text" with "Did I change my essay question?"
    And I press "Add Essay Prompt"
    And I follow "Logout"
    And I follow "Login"
    And I fill in "Email" with "applicant@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Apps"
    And I follow "STUDENTS"
    Then I should see "Did I change my essay question?"