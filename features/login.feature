# As a member of 180-Degrees Consulting
# I want to be able to log in, so I can view important info for members.


Feature: login page
  As a member of 180-Degrees Consulting
  I want to be able to log in, so I can view important info for members.
  
  Background:
    Given I am not logged in
    Given the following users exist:
  | email                 | password    | access |
  | rowan@funbun.com      | abc123      | admin  |
  | rowan2@funbun.com     | abc1234     | member |

  # going to the login page
  # Happy path:
  Scenario: logging in successfully
    Given I am on the home page
    And I follow the login page
    Then I should be on the login page
    And I fill in email with "rowan@funbun.com"
    And I fill in password with "abc123"
    And I press submit
    Then I should see "login successful"
  
  # Sad path:
  Scenario: failed application
    Given I am on the home page
    And I follow the login page
    Then I should be on the login page
    And I fill in name with "rowan@funbun.com"
    And I press submit
    Then I should see "password required"
