# As a member of 180-Degrees Consulting
# I want to be able to log in as an admin, so I can view important info for members.


Feature: login page
  As a member of 180-Degrees Consulting
  I want to be able to log in as an admin,
  so I can view important info for members.
  
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
    And I fill in "Email" with "rowan@berkeley.edu"
    And I fill in "Password" with "abc123"
    And I press "Submit"
    Then I should see "Login successful."
    And I should be on the admin page
  
  # Sad path:
  Scenario: failed application
    Given I am on the home page
    And I follow "Login"
    Then I should be on the login page
    And I fill in "Email" with "rowan@funion.com"
    And I press "Submit"
    Then I should see "Invalid email"
