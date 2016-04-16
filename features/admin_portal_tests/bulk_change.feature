# As an admin, I want to be able to mark applicants with a checkbox and press a submit button, 
# so I can change multiple application statuses at a time.

Feature: bulk accept/reject/change applicants
    As an admin,
    I want to be able to mark applicants with a checkbox and press a submit button,
    so I can change multiple application statuses at a time.
  
  Background:
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    
    Given the following applications exist:
    | name | email              | major         | graduation | info       |
    | S1   | s1@berkeley.edu    | French        | 1923       | wowzers!   |  
    | S2   | s2@berkeley.edu    | Baller        | 2007       | bball      |
    | S3   | s3@berkeley.edu    | Chicano       | 2020       | None       |
    | S4   | s4@berkeley.edu    | Hobo          | 2050       | None       |
  
  Scenario: accept some people
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Applications"
    
    # Everyone should be application pending.
    And I should see the "status" for "s1@berkeley.edu" as "Pending"
    And I should see the "status" for "s2@berkeley.edu" as "Pending"
    And I should see the "status" for "s3@berkeley.edu" as "Pending"
    And I should see the "status" for "s4@berkeley.edu" as "Pending"

    And I select checkbox for "s1@berkeley.edu"
    And I select checkbox for "s3@berkeley.edu"
    
    And I fill in "text" with "GRATZZZZ"
    And I press "Accept Selected"
    Then I should see "User has been notified of their updated application status by email."
    
    # The selected should have status = "accepted"
    And I should see the "status" for "s1@berkeley.edu" as "Accepted"
    And I should see the "status" for "s2@berkeley.edu" as "Pending"
    And I should see the "status" for "s3@berkeley.edu" as "Accepted"
    And I should see the "status" for "s4@berkeley.edu" as "Pending"

  Scenario: reject some people
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Applications"
    
    # Everyone should be application pending.
    And I should see the "status" for "s1@berkeley.edu" as "Pending"
    And I should see the "status" for "s2@berkeley.edu" as "Pending"
    And I should see the "status" for "s3@berkeley.edu" as "Pending"
    And I should see the "status" for "s4@berkeley.edu" as "Pending"

    And I select checkbox for "s2@berkeley.edu"
    And I select checkbox for "s4@berkeley.edu"
    
    
    And I fill in "text" with "Sorry man"
    And I press "Reject Selected"
    Then I should see "User has been notified of their updated application status by email."
    
    # The selected should have status = "rejected"
    And I should see the "status" for "s1@berkeley.edu" as "Pending"
    And I should see the "status" for "s2@berkeley.edu" as "Rejected"
    And I should see the "status" for "s3@berkeley.edu" as "Pending"
    And I should see the "status" for "s4@berkeley.edu" as "Rejected"
    