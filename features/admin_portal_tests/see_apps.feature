#As an admin, I want to be able to see the applications, so I can consider their applications.

Feature: seeing applications
  As an admin,
  I want to be able to see all the applications,
  So I can consider their applications

  Background:
    # Given I am not logged in
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    
    Given the following applications exist:
    | name        | email                     | major         | graduation | info       |
    | Bob Saget   | wow@chickennuggets.com    | French        | 1923       | wowzers!   |  
    | Jeremy Lin  | baller@ballah.com         | Baller        | 2007       | bball      |
    
    Given the following clients exist:
    | name                        | email                     | info                    |
    | Bobby Flay                  | cooking@cooking.com       | we need $$$$            |
    | Carmelo Anthony             | nyksucks@ny.com           | pls help                |
    
    Given the following sponsors exist:
    | name                        | email                     | info                    |
    | Guy Fieri                   | mmmbacon@bacon.com        | heres all our $$$       |
    
  Scenario: an admin can access the all applications page
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    # And I should see "Admin"
    And I follow "Admin"
    Then I should see "Applications"
  
  Scenario: checking applications
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Applications"
    
    # Check student
    Then I should see "Jeremy Lin"
    And I should see "baller@ballah.com"
    And I should see "Baller"
    And I should see "2007"
    And I should see "bball"
    
    # All students?
    And I should see "Bob Saget"
    
    # Check client
    And I should see "Bobby Flay"
    And I should see "cooking@cooking.com"
    And I should see "we need $$$$"
    
    # Check sponsor
    And I should see "Guy Fieri"
    And I should see "mmmbacon@bacon.com"
    And I should see "heres all our $$$"
    
  # Scenario: a non-admin cannot see all all application
  #   Given I am logged in as a non-admin
  #   When I go to the application page
  #   Then I should not see "All Applications"