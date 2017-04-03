Feature: see tags
  
    As a user,
    So I that I can see the tags
    I want to be able to see event tags on the index, edit, and be able to create them.
    
Background:  events have been added to the database

    Given the following events exist:
    | name                         | date         | description | ingredients  | minPartySize | curPartySize | maxPartySize | tags  | location | recipes        | image  |
    | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1            | 3            | 6            | #ants | my house | ants with lime | 42.jpg |
    | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1            | 2            | 3            | n/a   | n/a      | n/a            | 2.jpg  |
    | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1            | 2            | 3            | n/a   | n/a      | n/a            | 3.jpg  |
    | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1            | 2            | 3            | n/a   | n/a      | n/a            | 4.jpg  |
  
    And  I am on the BUMS home page

Scenario: Viewing Event Tags on Edit
    When I follow "Who Wants Some Grub?"
    And I follow "Edit"
    Then I should see "Tags"  
  
  
Scenario: Viewing Event Tags on Create
    When I follow "Create new event"
    Then I should see "Tags"

Scenario: Viewing Event Tags on Index
    Then I should see "Tags"
    And I should see "#ants"