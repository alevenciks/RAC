Feature: Blogpost feature
  Test the functionality of blogpost creation

  Scenario: Create blogpost - positive
    Given I have logged in as a regular user
    When I can create blogpost
    Then I can get blogpost

  Scenario: Edit blogpost - positive
    Given I have logged in as a regular user
    When I can create blogpost
    And I can update blogpost
    Then I can get blogpost