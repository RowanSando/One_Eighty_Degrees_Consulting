#As a visitor, I want to be able to go to the home page, so I can learn more about 180-Degrees.

Feature: home page
  As a visitor,
  I want to be able to go to the home page, 
  so I can learn more about 180-Degrees
  
Scenario: seeing the home page successfully
  Given I am on the home page
  Then I should see "180 Degrees"