Feature: System Metadata
  As a system administrator
  I want the view metadata for the capdash system so that I can quickly determine which version is running in a given environment

  Scenario: Get System Metadata
    Given the capdash system is running
    When I navigate to the url /info
    Then I should receive the response
      | name     | capdash2  |
      | version  | $version  |
      | hostname | $hostname |
