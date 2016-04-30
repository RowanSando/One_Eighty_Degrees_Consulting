# As an admin, I want to be able to click a link to go to each individual's application,
# so I can see their essays in detail.

Feature: application essays
    As an admin,
    I want to be able to click a link to go to each individual's application,
    So I can see their essays in detail.
  
  Background:
    # Given I am not logged in
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | student@asdf.edu            | password123 |             |
    
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
  
  Scenario: see one essay
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Applications"
    And I follow "View Essays" for "Bob Saget"
    Then I should see "Bob Saget Essays"

  Scenario: see all essays
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Applications"
    Then I should see "Bob Saget"
    And I should see "Jeremy Lin"
    
    When I follow "View Essays" for "Bob Saget"
    Then I should see "Bob Saget Essays"
    
    # When I press "Back to Applications"
    # And I follow "View Essays" for "Jeremy Lin"
    # Then I should see "Jeremy Lin Essays"
    # We took out "Back to Applications" Button since View Essays opens new tab