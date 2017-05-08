Feature: search by event name
 
    As a user,
    So I can easily find an event
    I should be able to search by event name

Background: events have been added to the database

    Given the following events exist:
    | name                         | date         |
    | Who Wants Some Grub?         | 25-Nov-2017  | 
    | Food Co-op: Wednesday Lunch  | 26-Oct-2017  |
    | Vegans ONLY!                 | 21-Jul-2017  |
    | I Want Some Grub!            | 26-Nov-2017  | 

  And  I am on the BUMS home page
  
Scenario: Searching for event and finding it
  When I fill in "search" with "Grub"
  And I press "Search Event Titles"
  Then I should see "Who Wants Some Grub?"
  And I should see "I Want Some Grub!"
  And I should not see "Vegans ONLY!"
  And I should not see "Food Co-op: Wednesday Lunch"
  
Scenario: Searching for an event that doesn't exist
  When I fill in "search" with "Market"
  And I press "Search Event Titles"
  Then I should not see "Who Wants Some Grub?"
  And I should not see "I Want Some Grub!"
  And I should not see "Vegans ONLY!"
  And I should not see "Food Co-op: Wednesday Lunch"