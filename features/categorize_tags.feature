Feature: categorize tags
  
    As a user
    So that I can categorize my tags
    I want to have tags be organized into type, ethnicity, dietary restrictions, and meal type(i.e potluck, dinner)
    
Background:  events have been added to the database

    Given the following events exist:
    | name                         | date         | description | ingredients  | minPartySize | curPartySize | maxPartySize | location | recipes        | image  | ethnicity         | dietary_restrictions | category           | user_id |
    | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1            | 3            | 6            | my house | ants with lime | 42.jpg | {"Asian":"1"}     | {"Kosher" : "1"}     | {"All_day":"1"}    | 1       |
    | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1            | 2            | 3            | n/a      | n/a            | 2.jpg  | {"Indian":"1"}    | {"Other":"1"}        | {"Restaurant":"1"} | 1       |
    | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1            | 2            | 3            | n/a      | n/a            | 3.jpg  | {"African":"1"}   | {"Vegan":"1"}        | {"Potluck":"1"}    | 1       |
    | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1            | 2            | 3            | n/a      | n/a            | 4.jpg  | {"French":"1"}    | {"Keto":"1"}         | {"Dinner":"1"}     | 1       |

    And  I am on the BUMS home page

@omniauth_test
Scenario: Viewing Ethnicity, Dietary Restrictions, and Category on Edit
    Given I am signed in with google  
    When I follow "Who Wants Some Grub?"
    And I follow "Edit"
    Then I should see "Ethnicity"
    And I should see "Dietary Restrictions"
    And I should see "Category"
  
Scenario: Viewing Ethnicty, Dietary Restrictions, and Category on Create
    When I follow "Create new event"
    Then I should see "Ethnicity"
    And I should see "Dietary Restrictions"
    And I should see "Category"

Scenario: Viewing Ethnicty, Dietary Restrictions, and Category on Index
    Then I should see "Ethnicity"
    And I should see "Dietary Restrictions"
    And I should see "Category"
    And I should see "Asian"
    And I should see "Indian"
    And I should see "African"
    And I should see "French"
    And I should see "Kosher"
    And I should see "Other"
    And I should see "Vegan"
    And I should see "Keto"
    And I should see "All_day"
    And I should see "Restaurant"
    And I should see "Potluck"
    And I should see "Dinner"

@omniauth_test
Scenario: Viewing checked boxes on Edit
    Given I am signed in with google
    When I follow "Who Wants Some Grub?"
    And I follow "Edit"
    Then the "event_ethnicity_Asian" checkbox should be checked
    And the "event_dietary_restrictions_Kosher" checkbox should be checked
    And the "event_category_All_day" checkbox should be checked