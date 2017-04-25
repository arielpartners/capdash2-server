Feature: Shelter Capacity
  As a user,
  I want to know the total capacity of a given shelter building
  So that I know how many clients can be sheltered on a given night

  #
  # Nick this is to drive the design of shelters
  # start at the bottom with Units.  Units have a number of beds, and a floor number,
  # and a reference to a building object and a reference to a shelter object
  # The shelter object should have a reference to a provider object
  # You can start simple and we can add more parameters later
  # Please also create RSPEC unit tests for each of them since they will each have specific behavior
  #
  # I recommend using slugs for the Restful URLs
  # http://stackoverflow.com/questions/1302022/best-way-to-generate-slugs-human-readable-ids-in-rails
  # https://rubygems.org/gems/slugify/versions/1.0.6
  # that will convert the building name to a valid URL component
  # that way we can avoid exposing UUID or database indexes to the outside world, unless we need to.
  #

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
      | Building  | Shelter                         | Surge Beds | Case Type | Date Opened   |
      | EW Bldg 1 | East Williamsburg Men's Shelter | 3          | Adult Male       | 4 April, 2003 |
    When I navigate to the url /shelters/1/buildings/EW-Bldg-1
    Then I should receive the following response
      | beds  | 10 |

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
    When I navigate to the url /shelters/2/buildings/730-Kelly-Street
    Then I should receive the following response
      | units | 7  |
      | beds  | 28 |
