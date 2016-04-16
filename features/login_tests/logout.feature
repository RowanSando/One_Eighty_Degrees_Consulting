#As an admin or application, I want to be able to log out, so others can login.
Feature: feature logout
  As an admin or application,
  I want to be able to log out,
  so others can login.
  
  Background:
    # Given I am not logged in
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | member@berkeley.edu         | password123 | member      |
  
  # logging out
  # Happy path:
  Scenario: logging out successfully
    Given I am on the home page
    And I follow "Login"
    Then I should be on the new_user_session page
    And I fill in "Email" with "member@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    Then I should see "Signed in successfully."
    And I follow "Logout"
    Then I should see "Signed out successfully."