Feature: Login
  As a user,
  I want to log in with my email and password


Scenario: successful user login
  Given I have opened capdash2
  When I login as the following user
    | username        | password |
    | joeblow@hbo.com | secret   |
  Then I should receive the following response
    | status | 200            |
    | token  | $validJwtToken |


Scenario: unsuccessful user login, wrong password
  Given I have opened capdash2
  When I login as the following user
    | username        | password  |
    | joeblow@hbo.com | iforgot   |
  Then I should receive the following response
    | status | 401 Unauthorized |
