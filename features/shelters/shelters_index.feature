Feature: Shelters Index
  As a capdash user,
  I want to see the list of shelters
  so that I can identify shelter buildings and navigate to provider information

Scenario: list all shelters
  Given Shelters in the system
    | Shelter                         | Provider                        |
    | East Williamsburg Men's Shelter | Project Renewal                 |
    | Tillary Women's Shelter         | Institute for Community Living  |
    | Anthony Adult Family Residence  | Samaritan Village               |
    | Life                            | NYC Dept of Homeless Services   |
    | Prospect Interfaith             | Homes for the Homeless          |
    | Bronx Acacia Cluster II         | Acacia Network Housing, Inc.    |
  When I navigate to the url /api/shelters
  Then I should see the following shelter information
    | Shelter                         |
    | East Williamsburg Men's Shelter |
    | Tillary Women's Shelter         |
    | Anthony Adult Family Residence  |
    | Life                            |
    | Prospect Interfaith             |
    | Bronx Acacia Cluster II         |
