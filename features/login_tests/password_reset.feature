#As a user, I want to be able to reset my password, so I can still log in if I forget my password.

Feature: reset password
  As a user,
  I want to be able to reset my password,
  so I can still log in if I forget my password.
  
  Background: 
    Given the following users exist:
    | email                       | password    | member_type |
    | applicant@berkeley.edu      | password123 | applicant   |
    
  Scenario: successfully sending email
    Given I am on the home page
    When I follow "Login"
    And I follow "Forgot your password?"
    Then I should see "Password Reset"