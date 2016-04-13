# As an applicant, I want to be able to check my application status, so I can see if I was accepted to 180-Degrees.

Feature: check status
  As an applicant
  I want to be able to check my application status
  So I can see if I was accepted to 180-Degrees.
  
    Background:
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    | bob@berkeley.edu            | bob123      | non-admin   |
    | jeremy@berkeley.edu         | jeremy123   | non-admin   |
    
    Given the following students exist:
    | name        | email                     | major         | graduation | info       |
    | Bob Saget   | bob@berkeley.edu          | French        | 1923       | wowzers!   |  
    | Jeremy Lin  | jeremy@berkeley.edu       | Baller        | 2007       | bball      |
  
  Scenario: application status pending
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "bob@berkeley.edu"
    And I fill in "Password" with "bob123"
    And I press "Log in"
    Then I should see "We are reviewing your application"

  Scenario: accepted application
    Given "Bob" is accepted
    And I am on the home page
    When I follow "Login"
    And I fill in "Email" with "bob@berkeley.edu"
    And I fill in "Password" with "bob123"
    And I press "Log in"
    Then I should see "accepted"
    
  Scenario: rejected application
    Given "Jeremy" is rejected
    And I am on the home page
    When I follow "Login"
    And I fill in "Email" with "jeremy@berkeley.edu"
    And I fill in "Password" with "jeremy123"
    And I press "Log in"
    Then I should see "sorry"