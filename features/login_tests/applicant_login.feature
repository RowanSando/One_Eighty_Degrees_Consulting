# As a student applying to 180-Degrees Consulting
# I want to be able to log in, so I can view the status of my application.


Feature: login page
  As a student applying to 180-Degrees Consulting
  I want to be able to log in, so I can view the status of my application.
  
  Background:
    # Given I am not logged in
    Given the following users exist:
    | email                   | password    | access    |
    | rowan@berkeley.edu      | abc123      | admin     |
    | rowan2@berkeley.edu     | abc1234     | applicant |

  # going to the login page
  # Happy path:
  Scenario: logging in successfully
    Given I am on the home page
    And I follow "Login"
    Then I should be on the login page
    And I fill in "Email" with "rowan2@berkeley.edu"
    And I fill in "Password" with "abc1234"
    And I press "Submit"
    Then I should see "Login successful."
    And I should see "My Application"
  
  # Sad path:
  Scenario: failed application
    Given I am on the home page
    And I follow "Login"
    Then I should be on the login page
    And I fill in "Email" with "rowan@funion.com"
    And I press "Submit"
    Then I should see "Invalid email"
