Feature: Shelter Utilization
  As a user,
  I want to know the number of beds and units that were occupied in a shelter on a given date,
  So that I can compare that to the shelter capacity and calculate utilization levels.

  Background:
    Given The following shelters exist in the system
      | Case Type            | Provider                            | Shelter                         | Shelter Type         | Building            | Street Address      | Borough   | Zip Code | Units |
      | Single Adult Male    | Project Renewal                     | East Williamsburg Men's Shelter | Adult Male Shelter   | EW Bldg 1           | 249 Varet Street    | Brooklyn  | 11206    | 140   |
      | Single Adult Female  | Institute for Community Living      | Tillary Women's Shelter         | Adult Female Shelter | Building 01         | 200 Tillary Street  | Brooklyn  | 11201    | 200   |
      | Adult Family         | Samaritan Village                   | Anthony Adult Family Residence  | Adult Shelter        | 1848 Anthony Avenue | 1848 Anthony Avenue | Bronx     | 10457    |  37   |
      | Adult Family         | NYC Department of Homeless Services | Life                            | Adult Family Tier 2  | 78 Catherine Street | 78 Catherine Street | Manhattan | 10038    |  45   |
      | Family with Children | Homes for the Homeless              | Prospect Interfaith             | Family Tier 2        | 730 Kelly Street    | 730 Kelly Street    | Bronx     | 10455    |  88   |
      | Family with Children | Acacia Network Housing, Inc.        | Bronx Acacia Cluster II         | Family Cluster       | 819 East 178 Street | 819 East 178 Street | Bronx     | 10460    | 796   |
    And The following census information exists in the system
      | Shelter                         | Building            | Street Address      | Shelter Date | Occupied |
      | East Williamsburg Men's Shelter | EW Bldg 1           | 249 Varet Street    | 06/05/2016    | 100      |
      | East Williamsburg Men's Shelter | EW Bldg 1           | 249 Varet Street    | 06/06/2016    | 104      |
      | East Williamsburg Men's Shelter | EW Bldg 1           | 249 Varet Street    | 06/07/2016    | 98       |
      | East Williamsburg Men's Shelter | EW Bldg 1           | 249 Varet Street    | 06/08/2016    | 102      |
      | East Williamsburg Men's Shelter | EW Bldg 1           | 249 Varet Street    | 06/09/2016    | 110      |
      | East Williamsburg Men's Shelter | EW Bldg 1           | 249 Varet Street    | 06/10/2016    | 118      |
      | East Williamsburg Men's Shelter | EW Bldg 1           | 249 Varet Street    | 06/11/2016    | 122      |
      | Tillary Women's Shelter         | Building 01         | 200 Tillary Street  | 06/05/2016    | 200      |
      | Tillary Women's Shelter         | Building 01         | 200 Tillary Street  | 06/06/2016    | 197      |
      | Tillary Women's Shelter         | Building 01         | 200 Tillary Street  | 06/07/2016    | 199      |
      | Tillary Women's Shelter         | Building 01         | 200 Tillary Street  | 06/08/2016    | 200      |
      | Tillary Women's Shelter         | Building 01         | 200 Tillary Street  | 06/09/2016    | 200      |
      | Tillary Women's Shelter         | Building 01         | 200 Tillary Street  | 06/10/2016    | 195      |
      | Tillary Women's Shelter         | Building 01         | 200 Tillary Street  | 06/11/2016    | 197      |
      | Anthony Adult Family Residence  | 1848 Anthony Avenue | 1848 Anthony Avenue | 06/05/2016    | 31       |
      | Anthony Adult Family Residence  | 1848 Anthony Avenue | 1848 Anthony Avenue | 06/06/2016    | 32       |
      | Anthony Adult Family Residence  | 1848 Anthony Avenue | 1848 Anthony Avenue | 06/07/2016    | 32       |
      | Anthony Adult Family Residence  | 1848 Anthony Avenue | 1848 Anthony Avenue | 06/08/2016    | 31       |
      | Anthony Adult Family Residence  | 1848 Anthony Avenue | 1848 Anthony Avenue | 06/09/2016    | 31       |
      | Anthony Adult Family Residence  | 1848 Anthony Avenue | 1848 Anthony Avenue | 06/10/2016    | 33       |
      | Anthony Adult Family Residence  | 1848 Anthony Avenue | 1848 Anthony Avenue | 06/11/2016    | 32       |
      | Life                            | 78 Catherine Street | 78 Catherine Street | 06/05/2016    | 43       |
      | Life                            | 78 Catherine Street | 78 Catherine Street | 06/06/2016    | 42       |
      | Life                            | 78 Catherine Street | 78 Catherine Street | 06/07/2016    | 43       |
      | Life                            | 78 Catherine Street | 78 Catherine Street | 06/08/2016    | 43       |
      | Life                            | 78 Catherine Street | 78 Catherine Street | 06/09/2016    | 43       |
      | Life                            | 78 Catherine Street | 78 Catherine Street | 06/10/2016    | 43       |
      | Life                            | 78 Catherine Street | 78 Catherine Street | 06/11/2016    | 43       |
      | Prospect Interfaith             | 730 Kelly Street    | 730 Kelly Street    | 06/05/2016    | 82       |
      | Prospect Interfaith             | 730 Kelly Street    | 730 Kelly Street    | 06/06/2016    | 83       |
      | Prospect Interfaith             | 730 Kelly Street    | 730 Kelly Street    | 06/07/2016    | 85       |
      | Prospect Interfaith             | 730 Kelly Street    | 730 Kelly Street    | 06/08/2016    | 83       |
      | Prospect Interfaith             | 730 Kelly Street    | 730 Kelly Street    | 06/09/2016    | 83       |
      | Prospect Interfaith             | 730 Kelly Street    | 730 Kelly Street    | 06/10/2016    | 82       |
      | Prospect Interfaith             | 730 Kelly Street    | 730 Kelly Street    | 06/11/2016    | 86       |
      | Bronx Acacia Cluster II         | 819 East 178 Street | 819 East 178 Street | 06/05/2016    | 630      |
      | Bronx Acacia Cluster II         | 819 East 178 Street | 819 East 178 Street | 06/06/2016    | 612      |
      | Bronx Acacia Cluster II         | 819 East 178 Street | 819 East 178 Street | 06/07/2016    | 625      |
      | Bronx Acacia Cluster II         | 819 East 178 Street | 819 East 178 Street | 06/08/2016    | 599      |
      | Bronx Acacia Cluster II         | 819 East 178 Street | 819 East 178 Street | 06/09/2016    | 585      |
      | Bronx Acacia Cluster II         | 819 East 178 Street | 819 East 178 Street | 06/10/2016    | 550      |
      | Bronx Acacia Cluster II         | 819 East 178 Street | 819 East 178 Street | 06/11/2016    | 595      |

  Scenario: Average Weekly Per-Shelter Utilization
    When I ask for the following average utilization by calendar period
      | Group By | Period Type | Period Ending |
      | Shelter  | Week        | 6/11/2016     |
    Then The system should provide the following average utilization
      | Facility                        | Building            | Street Address      | Period Ending | Average Utilization | Percentage |
      | East Williamsburg Men's Shelter | EW Bldg 1           | 249 Varet Street    | 06/11/2016    | 108                 | 77%        |
      | Tillary Women's Shelter         | Building 01         | 200 Tillary Street  | 06/11/2016    | 198                 | 99%        |
      | Anthony Adult Family Residence  | 1848 Anthony Avenue | 1848 Anthony Avenue | 06/11/2016    | 32                  | 86%        |
      | Life                            | 78 Catherine Street | 78 Catherine Street | 06/11/2016    | 43                  | 95%        |
      | Prospect Interfaith             | 730 Kelly Street    | 730 Kelly Street    | 06/11/2016    | 83                  | 95%        |
      | Bronx Acacia Cluster II         | 819 East 178 Street | 819 East 178 Street | 06/11/2016    | 599                 | 75%        |

  Scenario: Average Weekly Per-Case Type Utilization
    When I ask for the following average utilization by calendar period
      | Group By         | Period Type | Period Ending |
      | Case Type        | Week        | 6/11/2016     |
    Then The system should provide the following average utilization
      | Group                | Period Ending | Average Capacity | Average Utilization | Percentage |
      | Single Adult Male    | 06/11/2016    | 140              | 108                 | 77%        |
      | Single Adult Female  | 06/11/2016    | 200              | 198                 | 99%        |
      | Adult Family         | 06/11/2016    | 82               | 75                  | 91%        |
      | Family with Children | 06/11/2016    | 884              | 683                 | 77%        |
      | Total                | 06/11/2016    | 1306             | 1063                | 81%        |
