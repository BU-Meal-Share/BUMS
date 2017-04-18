Feature: categorize tags
  
    As a user
    So that I can categorize my tags
    I want to have tags be organized into type, ethnicity, dietary restrictions, and meal type(i.e potluck, dinner)
    
Background:  events have been added to the database

    Given the following events exist:
    | name                         | date         | description | ingredients  | minPartySize | curPartySize | maxPartySize | location | recipes        | image  | ethnicity | dietary_restrictions | category   |
    | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1            | 3            | 6            | my house | ants with lime | 42.jpg | asian     | kosher               | cafe       | 
    | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1            | 2            | 3            | n/a      | n/a            | 2.jpg  | indian    | other                | restaurant |
    | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1            | 2            | 3            | n/a      | n/a            | 3.jpg  | african   | vegan                | potluck    |
    | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1            | 2            | 3            | n/a      | n/a            | 4.jpg  | french    | keto                 | dinner     |  

    And  I am on the BUMS home page

Scenario: Viewing Ethnicity, Dietary Restrictions, and Category on Edit
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
    And I should see "asian"
    And I should see "indian"
    And I should see "african"
    And I should see "french"
    And I should see "kosher"
    And I should see "other"
    And I should see "vegan"
    And I should see "keto"
    And I should see "cafe"
    And I should see "restaurant"
    And I should see "potluck"
    And I should see "dinner"

