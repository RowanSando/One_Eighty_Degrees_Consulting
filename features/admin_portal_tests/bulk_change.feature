# As an admin, I want to be able to mark applicants with a checkbox and press a submit button, 
# so I can change multiple application statuses at a time.

Feature: bulk accept/reject/change applicants
    As an admin,
    I want to be able to mark applicants with a checkbox and press a submit button,
    so I can change multiple application statuses at a time.
    
    Given the following students exist:
    | name | email              | major         | graduation | info       |
    | S1   | s1@berkeley.edu    | French        | 1923       | wowzers!   |  
    | S2   | s2@berkeley.edu    | Baller        | 2007       | bball      |
    | S3   | s3@berkeley.edu    | Chicano       | 2020       | None       |
    | S4   | s4@berkeley.edu    | Hobo          | 2050       | None       |
  
  Scenario: accept some people
    Given I am on the admin page
    And I follow "Applications"
    
    # Everyone should be application pending.
    And I should see the status for "s1@berkeley.edu" as "Pending"
    And I should see the status for "s2@berkeley.edu" as "Pending"
    And I should see the status for "s3@berkeley.edu" as "Pending"
    And I should see the status for "s4@berkeley.edu" as "Pending"

    And I select checkbox for "s1@berkeley.edu"
    And I select checkbox for "s3@berkeley.edu"
    
    And I press "Accept All Selected"
    Then I should see "Input Message"
    And I fill in "Message" with "GRATZZZZ"
    Then I press "Submit"
    Then I should see "Status updated."
    
    # The selected should have status = "accepted"
    And I should see the status for "s1@berkeley.edu" as "Accepted"
    And I should see the status for "s2@berkeley.edu" as "Pending"
    And I should see the status for "s3@berkeley.edu" as "Accepted"
    And I should see the status for "s4@berkeley.edu" as "Pending"

  Scenario: reject some people
    Given I am on the admin page
    And I follow "Applications"
    
    # Everyone should be application pending.
    And I should see the status for "s1@berkeley.edu" as "Accepted"
    And I should see the status for "s2@berkeley.edu" as "Pending"
    And I should see the status for "s3@berkeley.edu" as "Accepted"
    And I should see the status for "s4@berkeley.edu" as "Pending"

    And I select checkbox for "s2@berkeley.edu"
    And I select checkbox for "s4@berkeley.edu"
    
    And I press "Reject All Selected"
    Then I should see "Input Message"
    And I fill in "Message" with "Sorry man"
    Then I press "Submit"
    Then I should see "Status updated."
    
    # The selected should have status = "rejected"
    And I should see the status for "s1@berkeley.edu" as "Accepted"
    And I should see the status for "s2@berkeley.edu" as "Rejected"
    And I should see the status for "s3@berkeley.edu" as "Accepted"
    And I should see the status for "s4@berkeley.edu" as "Rejected"
    
    # Accepted person should've gotten rejected:
    And I select checkbox for "s1@berkeley.edu"
    And I press "Reject All Selected"
    Then I should see "Input Message"
    And I fill in "Message" with "oops messed up, sorry man"
    Then I press "Submit"
    Then I should see "Status updated."
    
    # Then S1 should be rejected
    And I should see the status for "s1@berkeley.edu" as "Rejected"
    And I should see the status for "s2@berkeley.edu" as "Rejected"
    And I should see the status for "s3@berkeley.edu" as "Accepted"
    And I should see the status for "s4@berkeley.edu" as "Rejected"
    