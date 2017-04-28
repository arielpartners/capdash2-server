Feature: Healthcheck
  As a system Administrator
  I want the capdash system to expose a method of quickly determining the health of the system

Scenario: Get Healthcheck Endpoints
  Given the capdash system is running
  When I navigate to the url /api/healthcheck
  Then I should receive the following response
    | status      | 204 No Content  |
