Feature: Providers Index
  As a capdash user,
  I want to see the list of providers
  so that I can see their administrative and billing information.

@ignore
Scenario: list all providers
  Given Providers in the system
    | Provider                            |
    | Project Renewal                     |
    | Institute for Community Living      |
    | Samaritan Village                   |
    | NYC Department of Homeless Services |
    | Homes for the Homeless              |
    | Acacia Network Housing, Inc.        |
  When I navigate to the url /providers
  Then I should see the following provider information
    | Provider                            |
    | Project Renewal                     |
    | Institute for Community Living      |
    | Samaritan Village                   |
    | NYC Department of Homeless Services |
    | Homes for the Homeless              |
    | Acacia Network Housing, Inc.        |
