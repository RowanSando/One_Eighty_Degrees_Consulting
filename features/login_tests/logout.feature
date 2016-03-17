# As a potential corporate sponsor, I want to be able to apply so that I can get connected with 180-Degrees.
Feature: feature logout
  As an admin or application,
  I want to be able to log out,
  so others can login.
    
  # logging out
  # Happy path:
  Scenario: logging out successfully
    Given I am logged in
    When I press "Logout"
    Then I should see "Logout Successful"