Feature: Shelter Utilization Audit Trail
  As a user,
  I want to know the shelter census information as of a given date
  So that I can reproduce an older census report at a later date even if the number gets corrected

  #
  # Please note the date issue:  when I ask for the 6/5 census, I actually get the information from 6/6 at 2am !!!!
  # We can do that, but we would have to introduce a new concept of "business date"
  # business date is different from calendar date.  Business date of 6/6 2am is calendar date 6/5 since it is considered
  # the evening of 6/5.  Does this make sense????
  #

  Background:
    Given The following shelters exist in the system
      | Group | Provider        | Facility                        | Facility Type      | Building  | Street Address   | Borough  | Zip Code | Community District | School District | Capacity |
      | Adult | Project Renewal | East Williamsburg Men's Shelter | Adult Male Shelter | EW Bldg 1 | 249 Varet Street | Brooklyn | 11206    | 301                | 14              | 140      |
    And The following census information exists in the system
      | Facility                        | Building  | Street Address   | Census DateTime    | Census Count | Entry DateTime     | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/05/2016 8:00pm  | 90           | 06/06/2016 10:15am | kpeterson   |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/05/2016 10:00pm | 95           | 06/06/2016 10:15am | cstrong     |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/06/2016 12:00am | 97           | 06/06/2016 10:15am | bgramman    |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/06/2016 2:00am  | 98           | 06/06/2016 10:15am | bgramman    |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/06/2016 2:00am  | 103          | 06/09/2016 2:30pm  | niorio      |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 249 Varet Street | 06/06/2016 8:00pm  | 95           | 06/07/2016 10:15am | kpeterson   |

  @ignore
  Scenario: Get latest version of census
    When I ask for census information
      | Facility                        | Building  | Census Date | As Of Date |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/05/2016  |            |
    Then The system should provide the following census information
      | Facility                        | Building  | Census DateTime   | As Of Date | Census Count | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/06/2016 2:00am | today      | 103          | niorio      |

  @ignore
  Scenario: Get previous version of census
    When I ask for census information
      | Facility                        | Building  | Census Date | As Of Date |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/05/2016  | 06/07/2016 |
    Then The system should provide the following census information
      | Facility                        | Building  | Census DateTime   | As Of Date | Census Count | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/06/2016 2:00am | 06/07/2016 | 98           | bgramman    |

  @ignore
  Scenario: Get census entries by author
    When I ask for census information
      | Facility                        | Building  | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | kpeterson   |
    Then The system should provide the following census information
      | Facility                        | Building  | Census DateTime   | As Of Date         | Census Count | Who Entered |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/05/2016 8:00pm | 06/06/2016 10:15am | 90           | kpeterson   |
      | East Williamsburg Men's Shelter | EW Bldg 1 | 06/06/2016 8:00pm | 06/07/2016 10:15am | 95           | kpeterson   |