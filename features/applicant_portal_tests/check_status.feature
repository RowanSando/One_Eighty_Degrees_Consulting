# As an applicant, I want to be able to check my application status, so I can see if I was accepted to 180-Degrees.

Feature: check and edit application
  As an applicant
  I want to be able to check my application status and view/edit the contents
  So I can update my application before the deadline
  
    Background:
    Given the following users exist:
    | name      | email                       | password    | member_type | id |
    |Bob Saget  | bob@berkeley.edu            | bob12345    | applicant   | 1  |
    |Jeremy Lin | jeremy@berkeley.edu         | jeremy123   | applicant   | 2  |
    |Henry Lin  | henry@berkeley.edu          | henry123    | applicant   | 3  |
    
    Given the following applications exist:
    |email              | major             | graduation | info       | essay |  status    | id |
    |b@berkeley.edu    | French        | 1923       | wowzers!   |  a    |  Pending   | 1  |
    |j@berkeley.edu | Baller        | 2007       | bball      |  a    |  Accepted  | 2  |
    |h@berkeley.edu  | CS            | 2008       | bball      |  a    |  Rejected  | 3  |
    And the user "1" has the application "1"
    And the user "2" has the application "2"
    And the user "3" has the application "3"

    
  Scenario: viewing application successfully
    Given I am on the new user session page
    And I fill in "Email" with "bob@berkeley.edu"
    And I fill in "Password" with "bob12345"
    And I press "Log in"
    And I go to the application for studentapplications page
    Then I should see "Bob Saget"
    And I should see "bob@berkeley.edu"
    And I should see "French"
    And I should see "1923"
    And I should see "wowzers"
    And I should see "a"
    
  Scenario: applicant unable to edit status
    Given I am on the new user session page 
    And I fill in "Email" with "bob@berkeley.edu"
    And I fill in "Password" with "bob12345"
    And I press "Log in"
    And I go to the application for studentapplications page
    And I follow "Edit"
    Then I should not see "status"

  Scenario: applicant able to edit contents
    Given I am on the new user session page 
    And I fill in "Email" with "bob@berkeley.edu"
    And I fill in "Password" with "bob12345"
    And I press "Log in"
    And I go to the application for studentapplications page
    And I follow "Edit"
    And I fill in "Major" with "EECS"
    And I fill in "Graduation" with "2016"
    And I fill in "Info" with "info"
    # And I fill in "Essay" with "essay"
    And I press "Update Application"
    Then I should see "EECS"
    And I should see "2016"
    And I should see "info"
    # And I should see "essay"
    
    
  Scenario: pending application
    Given I am on the new user session page
    And I fill in "Email" with "bob@berkeley.edu"
    And I fill in "Password" with "bob12345"
    And I press "Log in"
    And I go to the home page
    And I go to the application for studentapplications page
    Then I should see "We are presently in the process of reviewing."
    
  Scenario: accepted application
    Given I am on the new user session page 
    And I fill in "Email" with "jeremy@berkeley.edu"
    And I fill in "Password" with "jeremy123"
    And I press "Log in"
    And I go to the application for studentapplications page
    Then I should see "You are accepted"
    
  Scenario: rejected application
    Given I am on the new user session page
    And I fill in "Email" with "henry@berkeley.edu"
    And I fill in "Password" with "henry123"
    And I press "Log in"
    And I go to the application for studentapplications page
    Then I should see "Sorry"