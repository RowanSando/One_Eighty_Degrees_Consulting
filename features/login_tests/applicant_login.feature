# As a student applying to 180-Degrees Consulting
# I want to be able to log in, so I can view the status of my application.


Feature: login page
  As a student applying to 180-Degrees Consulting
  I want to be able to log in, so I can view the status of my application.
  
  Background:
    # Given I am not logged in
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | member@berkeley.edu         | password123 | member      |


  # going to the login page
  # Happy path:
  Scenario: logging in successfully
    Given I am on the home page
    And I follow "Login"
    Then I should be on the new_user_session page
    And I fill in "Email" with "member@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    Then I should be on the home page 
    And I should see "Signed in successfully."
  
  # Sad path:
  Scenario: failed application
    Given I am on the home page
    And I follow "Login"
    Then I should be on the new_user_session page
    And I fill in "Email" with "rowan@funion.com"
    And I press "Log in"
    Then I should see "Invalid email or password."
