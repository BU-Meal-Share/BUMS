Feature: show an event
 
    As a user
    so that I can see what food an event has
    I want to be able to view an event.

Background: events have been added to the database

    Given the following events exist:
    | name                         | date         | description | ingredients  | minPartySize | curPartySize | maxPartySize | location | recipes        | image  | ethnicity          | dietary_restrictions | category            |
    | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1            | 3            | 6            | my house | ants with lime | 42.jpg | {"asian":"1"}     | {"kosher" : "1"}      | {"cafe":"1"}       | 
    | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1            | 2            | 3            | n/a      | n/a            | 2.jpg  | {"indian":"1"}    | {"other":"1"}       | {"restaurant":"1"} |
    | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1            | 2            | 3            | n/a      | n/a            | 3.jpg  | {"african":"1"}   | {"vegan":"1"}       | {"potluck":"1"}    |
    | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1            | 2            | 3            | n/a      | n/a            | 4.jpg  | {"french":"1"}    | {"keto":"1"}        | {"dinner":"1"}     |  

  And  I am on the BUMS home page
  
Scenario: Viewing An Event
  When I follow "Who Wants Some Grub?"
  Then I should see "Who Wants Some Grub?"
  And I should see "Ingredients: ants, grubs"
  And I should see "Description: foo"
  And I should see "Date: 25-Nov-2017"
  And I should see the image "42.jpg"

Scenario: Return to Home Page
  When I follow "Who Wants Some Grub?"
  And I follow "Back to Home"
  Then I should be on the BUMS home page

Scenario: Viewing an Event with additional info
  When I follow "Who Wants Some Grub?"
  Then I should see "Who Wants Some Grub?"
  And I should see "Ingredients: ants, grubs"
  And I should see "Description: foo"
  And I should see "Date: 25-Nov-2017"
  And I should see "MinPartySize: 1"
  And I should see "CurrentPartySize: 3"
  And I should see "MaxPartySize: 6"
  And I should see "Location: my house"
  And I should see "Recipe: ants with lime"
  And I should see the image "42.jpg"
  And I should see "asian"
  And I should see "kosher"
  And I should see "cafe"

