Feature: Shelter Utilization Audit Trail
  As a user,
  I want to know the shelter census information as of a given date
  So that I can reproduce an older census report at a later date even if the number gets corrected

  Background:
    Given The following shelters exist in the system
      | Case Type        | Provider        | Shelter                         | Shelter Type       | Building  | Street Address   | Borough  | Zip Code | Units |
      | Adult Male       | Project Renewal | East Williamsburg Men's Shelter | Adult Male Shelter | EW Bldg 1 | 249 Varet Street | Brooklyn | 11206    | 140   |
    And The following occupied units information exists in the system
      | Shelter                         | Building  | Street Address   | Census DateTime    | Occupied Units | Entry DateTime     | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/05/2016 8:00pm  | 90             | 06/06/2016 10:15am | kpeterson   |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/05/2016 10:00pm | 95             | 06/06/2016 10:15am | cstrong     |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/06/2016 12:00am | 97             | 06/06/2016 10:15am | bgramman    |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/06/2016 2:00am  | 98             | 06/06/2016 10:15am | bgramman    |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/06/2016 2:00am  | 103            | 06/09/2016 2:30pm  | niorio      |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/06/2016 8:00pm  | 95             | 06/07/2016 10:15am | kpeterson   |

  Scenario: Get latest version of census
    When I ask for census information
      | Shelter                         | Building  | Business Date | As Of Date |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/05/2016    |            |
    Then The system should provide the following census information
      | Shelter                         | Building  | Census DateTime   | As Of Date | Occupied Units | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/06/2016 2:00am | today      | 103            | niorio      |

  Scenario: Get previous version of census
    When I ask for census information
      | Shelter                         | Building  | Business Date | As Of Date |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/05/2016    | 06/07/2016 |
    Then The system should provide the following census information
      | Shelter                         | Building  | Census DateTime   | As Of Date | Occupied Units | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/06/2016 2:00am | 06/07/2016 | 98             | bgramman    |

  Scenario: Get census entries by author
    When I ask for census information
      | Shelter                         | Building  | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | kpeterson   |
    Then The system should provide the following census information
      | Shelter                         | Building  | Census DateTime   | As Of Date         | Occupied Units | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/06/2016 8:00pm | 06/07/2016 10:15am | 95             | kpeterson   |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/05/2016 8:00pm | 06/06/2016 10:15am | 90             | kpeterson   |
