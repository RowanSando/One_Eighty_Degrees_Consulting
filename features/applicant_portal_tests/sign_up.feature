# As a potential applicant, I want to be able to signup, 
# so I can apply to 180-Degrees.

Feature: signup
  As a potential applicant
  I want to be able to signup,
  So I can apply to 180-Degrees
  
  # happy path
  Scenario: successfully signup
    Given I am on the new_user_registration page
    # When I fill in "name" with "Bob Lee"
    And I fill in "Email" with "blee@berkeley.edu"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

  # sad paths
  Scenario: password not match
    Given I am on the new_user_registration page
    # When I fill in "name" with "Bob Lee"
    And I fill in "Email" with "blee@berkeley.edu"
    And I fill in "Password" with "12344"
    And I fill in "Password confirmation" with "crapiforgot"
    And I press "Sign up"
    Then I should see "doesn't match Password"
    
  Scenario: password too short
    Given I am on the new_user_registration page
    # When I fill in "name" with "Bob Lee"
    # missing email
    And I fill in "Email" with "blee@berkeley.edu"
    And I fill in "Password" with "12344"
    And I press "Sign up"
    Then I should see "too short (minimum is 8 characters)"
    
  Scenario: not a valid e-mail address
    Given I am on the new_user_registration page
    # When I fill in "name" with "Bob Lee"
    And I fill in "Email" with "blee"
    And I fill in "Password" with "12344"
    And I fill in "Password confirmation" with "12344"
    And I press "Sign up"
    Then I should see "is invalid"