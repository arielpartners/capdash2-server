Feature: Monitoring
  As a systems administrator
  I want to know when events of interest occur
  So that I can monitor the health of the system and generate alerts

Scenario: User Login success
  Given The following user exists in the system
    | email           | password |
    | joeblow@hbo.com | secret   |
  And StatsD is running
  When I login as the following user
    | email           | password |
    | joeblow@hbo.com | secret   |
  Then I should see the log
    | Level | Message              |
    | INFO  | User.login.success:1 |

Scenario: User Login failure
  Given The following user exists in the system
    | email           | password |
    | joeblow@hbo.com | secret   |
  And StatsD is running
  When I login as the following user
    | email           | password |
    | joeblow@hbo.com | iforgot  |
  Then I should see the log
    | Level | Message              |
    | INFO  | User.login.failure:1 |
