# As an admin, I want an email to be sent to the applicant when their status has been updated, so that they will know that their application has been reviewed.

Feature: sending status email
  As an admin,
  I want an email to be sent to the applicant when their status has been updated,
  so that they will know that their application has been reviewed.
  
  Background:
    Given the following users exist:
    | email                       | password    | member_type |
    | admin@berkeley.edu          | password123 | admin       |
    
    Given the following students exist:
    | name        | email                     | major         | graduation | info       | status  |
    | Bob Saget   | wow@chickennuggets.com    | French        | 1923       | wowzers!   | pending |
    | Jeremy Lin  | baller@ballah.com         | Baller        | 2007       | bball      | pending |
     
    
  Scenario: as an admin, an email should be sent when I change an applicant's status
    Given I am on the home page
    When I follow "Login"
    And I fill in "Email" with "admin@berkeley.edu"
    And I fill in "Password" with "password123"
    And I press "Log in"
    And I follow "Admin"
    And I follow "Applications"
    And I select checkbox for "wow@chickennuggets.com"
    And I press "Accept all"
    And I fill in "Message" with "gratz"
    Then I should see "Status updated."