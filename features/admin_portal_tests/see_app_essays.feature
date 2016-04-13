# As an admin, I want to be able to click a link to go to each individual's application,
# so I can see their essays in detail.

Feature: application essays
    As an admin,
    I want to be able to click a link to go to each individual's application,
    So I can see their essays in detail.
  
  Scenario: see one essay
    Given I am on the admin page
    And I follow "Applications"
    And I follow "Bobby Flay"
    Then I should see "Bobby Flay Essays"

  Scenario: see all essays
    Given I am on the admin page
    And I follow "Applications"
    Then I should see "Bobby Flay"
    And I should see "Guy Fieri"
    And I should see "Chancellor Dirks"
    
    When I follow "Chancellor Dirks"
    Then I should see "Chancellor Dirks Essays"
    
    When I follow "Back to Applications"
    And I follow "Guy Fieri"
    Then I should see "Guy Fieri Essays"