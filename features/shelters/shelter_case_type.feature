Feature: Shelter Case Type
  As a capdash user,
  I want to group shelter units by case type
  so that I can see better understand capacity utilization for families as opposed to single adults or adult families

  Scenario Outline: Default case type for shelter
    Given Shelter Buildings in the system
      | Case Type         | Provider                            | Shelter                         | Shelter Type   | Building            | Street Address      | Borough   | Zip Code |
      | Single Adult Male | Project Renewal                     | East Williamsburg Men's Shelter | Shelter        | EW Bldg 1           | 249 Varet Street    | Brooklyn  | 11206    |
      |                   | Institute for Community Living      | Tillary Shelter                 | Shelter        | Building 01         | 200 Tillary Street  | Brooklyn  | 11201    |
    And Shelter Floors in the system
      | Floor | Building    | Shelter                         | Beds | Case Type           |
      | 1     | EW Bldg 1   | East Williamsburg Men's Shelter | 20   |                     |
      | 2     | EW Bldg 1   | East Williamsburg Men's Shelter | 20   |                     |
      | 3     | EW Bldg 1   | East Williamsburg Men's Shelter | 20   |                     |
      | 1     | Building 01 | Tillary Shelter                 | 20   | Single Adult Male   |
      | 2     | Building 01 | Tillary Shelter                 | 20   | Single Adult Female |
    When we ask for the Case type for the building "<Building>" and floor "<Floor>"
    Then we are told it is case type "<Case Type>"

  Examples:
      | Building    | Floor | Case Type           |
      | EW Bldg 1   | 1     | Single Adult Male   |
      | EW Bldg 1   | 2     | Single Adult Male   |
      | Building 01 | 1     | Single Adult Male   |
      | Building 01 | 2     | Single Adult Female |

  Scenario: Case type hierarchy rollup
    Given Shelter Buildings in the system
      | Case Type           | Provider                            | Shelter                         | Shelter Type   | Building            | Street Address      | Borough   | Zip Code |
      | Single Adult Male   | Project Renewal                     | East Williamsburg Men's Shelter | Shelter        | EW Bldg 1           | 249 Varet Street    | Brooklyn  | 11206    |
      | Single Adult Male   | Project Renewal                     | Allent Men's Shelter            | Shelter        | 111 William Street  | 111 William Street  | Brooklyn  | 11222    |
      | Single Adult Female | Institute for Community Living      | Tillary Woman's Shelter         | Shelter        | Building 01         | 200 Tillary Street  | Brooklyn  | 11201    |
      | Single Adult Female | Institute for Community Living      | Tillary Woman's Shelter         | Shelter        | Building 01         | 200 Tillary Street  | Brooklyn  | 11201    |
    When I group the number of shelter buildings in the system by Identifier:
      | Case Type | Single Adult |
    Then I should see 4 shelter buildings
