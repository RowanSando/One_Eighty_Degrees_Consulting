#As an admin, I want to be able to see the applications, so I can consider their applications.

Feature: seeing applications
  As an admin,
  I want to be able to see the applications,
  So I can consider their applications
  
  Scenario: an admin can see all applications
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    # And I should see "Signed in successfully."
    And I should see "Admin"
    And I follow "Admin"
    Then I should see "Applications"
  
  # Scenario: an admin can see all applications
  #   Given I am logged into the admin panel
  #   When I go to the application page
  #   Then I should see "All Applications"
  
  # Scenario: a non-admin cannot see all all application
  #   Given I am logged in as a non-admin
  #   When I go to the application page
  #   Then I should not see "All Applications"