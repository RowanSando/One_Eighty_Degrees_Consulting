#As a potential user, I want to be able to confirm my new account's sign up by email, so I can confirm that I made an account with my email.

Feature: email confirm
  As a potential user,
  I want to be able to confirm my new account's sign up by email,
  so I can confirm that I made an account with my email.
  
  Scenario: successfully send emails
    Given I am on the new_user_registration page
    # When I fill in "name" with "Bob Lee"
    And I fill in "Email" with "blee@berkeley.edu"
    And I fill in "Password" with "password123"
    And I fill in "Confirm password" with "password123"
    And I press "Sign up"
    Then I should see "A message with a confirmation link has been sent to your email address."