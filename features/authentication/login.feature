Feature: Login
  As a user,
  I want to log in with my email and password
  so that I know the system is secure against unauthorized access

Scenario: successful user login
  Given The following user exists in the system
    | email           | password |
    | joeblow@hbo.com | secret   |
  When I login as the following user
    | email           | password |
    | joeblow@hbo.com | secret   |
  Then I should receive the following response
    | status | 201 Created    |
    | jwt    | $validJwtToken |

Scenario: unsuccessful user login, wrong password
  Given The following user exists in the system
    | email           | password |
    | joeblow@hbo.com | secret   |
  When I login as the following user
    | email           | password  |
    | joeblow@hbo.com | iforgot   |
  Then I should receive the following response
    | status | 404 Not Found |
