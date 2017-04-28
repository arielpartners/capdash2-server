Feature: Shelters Index
  As a capdash user,
  I want to see the list of shelter buildings
  so that I know what capacity is available and the physical locations where sheltering is offered

@ignore
Scenario: list all shelter buildings
  Given Shelters buildings in the system
    | Case Type            | Provider                            | Shelter                         | Shelter Type         | Building            | Street Address      | Borough   | Zip Code |
    | Adult Male           | Project Renewal                     | East Williamsburg Men's Shelter | Adult Male Shelter   | EW Bldg 1           | 249 Varet Street    | Brooklyn  | 11206    |
    | Adult Female         | Institute for Community Living      | Tillary Women's Shelter         | Adult Female Shelter | Building 01         | 200 Tillary Street  | Brooklyn  | 11201    |
    | Adult Family         | Samaritan Village                   | Anthony Adult Family Residence  | Adult Shelter        | 1848 Anthony Avenue | 1848 Anthony Avenue | Bronx     | 10457    |
    | Adult Family         | NYC Department of Homeless Services | Life                            | Adult Family Tier 2  | 78 Catherine Street | 78 Catherine Street | Manhattan | 10038    |
    | Family with Children | Homes for the Homeless              | Prospect Interfaith             | Family Tier 2        | 730 Kelly Street    | 730 Kelly Street    | Bronx     | 10455    |
    | Family With Children | Acacia Network Housing, Inc.        | Bronx Acacia Cluster II         | Family Cluster       | 819 East 178 Street | 819 East 178 Street | Bronx     | 10460    |
  When I navigate to the url /api/shelter_buildings
  Then I should see the following shelter building information
    | Building            |
    | EW Bldg 1           |
    | Building 01         |
    | 1848 Anthony Avenue |
    | 78 Catherine Street |
    | 730 Kelly Street    |
    | 819 East 178 Street |
