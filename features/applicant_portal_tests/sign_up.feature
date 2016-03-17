# As a potential applicant, I want to be able to signup, 
# so I can apply to 180-Degrees.

Feature: signup
  As a potential applicant
  I want to be able to signup,
  So I can apply to 180-Degrees

  Scenario: going to signup
    Given I am on the home page
    When I follow "Login"
    Then I should see "Signup"
  
  # happy path
  Scenario: successfully signup
    Given I am on the login page
    When I fill in "name" with "Bob Lee"
    And I fill in "email" with "blee@berkeley.edu"
    And I fill in "password" with "12344"
    And I fill in "confirm password" with "12344"
    And I press "Signup"
    Then I should see "Sign up successful"

  # sad paths
  Scenario: password not match
    Given I am on the login page
    When I fill in "name" with "Bob Lee"
    And I fill in "email" with "blee@berkeley.edu"
    And I fill in "password" with "12344"
    And I fill in "confirm password" with "crapiforgot"
    And I press "Signup"
    Then I should see "Error, password does not match!"
    
  Scenario: missing info
    Given I am on the login page
    When I fill in "name" with "Bob Lee"
    # missing email
    And I fill in "password" with "12344"
    And I fill in "confirm password" with "12344"
    And I press "Signup"
    Then I should see "Missing information!"
    
  Scenario: not a valid e-mail address
    Given I am on the login page
    When I fill in "name" with "Bob Lee"
    And I fill in "email" with "blee@cars.com"
    And I fill in "password" with "12344"
    And I fill in "confirm password" with "12344"
    And I press "Signup"
    Then I should see "Must use a Berkeley e-mail."