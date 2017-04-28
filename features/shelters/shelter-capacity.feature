Feature: Shelter Capacity
  As a user,
  I want to know the total capacity of a given shelter building
  So that I know how many clients can be sheltered on a given night

  @ignore
  Scenario: Adult shelter with many beds in large open area
    Given the following list of shelter beds:
      | Bed  | Floor | Building  | Shelter ID | Shelter                         |
      | 1    | 1     | EW Bldg 1 | 1          | East Williamsburg Men's Shelter |
      | 2    | 1     | EW Bldg 1 | 1          | East Williamsburg Men's Shelter |
      | 3    | 1     | EW Bldg 1 | 1          | East Williamsburg Men's Shelter |
      | 4    | 1     | EW Bldg 1 | 1          | East Williamsburg Men's Shelter |
      | 5    | 1     | EW Bldg 1 | 1          | East Williamsburg Men's Shelter |
      | 6    | 1     | EW Bldg 1 | 1          | East Williamsburg Men's Shelter |
      | 7    | 1     | EW Bldg 1 | 1          | East Williamsburg Men's Shelter |
    And the following shelter building information:
      | Building  | Shelter                         | Surge Beds | Population Group | Date Opened   |
      | EW Bldg 1 | East Williamsburg Men's Shelter | 3          | Adult Male       | 4 April, 2003 |
    When I navigate to the url /api/shelters/1/buildings/EW-Bldg-1
    Then I should receive the following response
      | units | 7  |
      | beds  | 10 |

    @ignore
  Scenario: Family multi-floor shelter
    Given the following list of shelter units:
      | Unit | Floor | Building         | Shelter ID | Shelter              | Beds |
      | 1A   | 1     | 730 Kelly Street | 2          | Prospect Interfaith  | 4    |
      | 1B   | 1     | 730 Kelly Street | 2          | Prospect Interfaith  | 4    |
      | 1C   | 1     | 730 Kelly Street | 2          | Prospect Interfaith  | 4    |
      | 2A   | 2     | 730 Kelly Street | 2          | Prospect Interfaith  | 4    |
      | 2B   | 2     | 730 Kelly Street | 2          | Prospect Interfaith  | 4    |
      | 2C   | 2     | 730 Kelly Street | 2          | Prospect Interfaith  | 4    |
      | 3A   | 3     | 730 Kelly Street | 2          | Prospect Interfaith  | 4    |
    When I navigate to the url /api/shelters/2/buildings/730-Kelly-Street
    Then I should receive the following response
      | units | 7  |
      | beds  | 28 |
