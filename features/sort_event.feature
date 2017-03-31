Feature: sort events
  
    As a user,
    so that I can quickly find events,
    I want to be able to sort by names and dates.

Background: events have been added to the database

  Given the following events exist:
  | name                         | date         | description | ingredients  |
  | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  |
  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  |
  | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash |
  | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          |

  And  I am on the BUMS home page
  
Scenario: Sort by name
  When I check "option_name"
  And I press "Sort"
  Then I should see "Dinner on Main St" before "Food Co-op: Wednesday Lunch"
  And I should see "Food Co-op: Wednesday Lunch" before "Vegans ONLY!"
  And I should see "Vegans ONLY!" before "Who Wants Some Grub?"
  
Scenario: Sort by date
  When I check "option_date"
  And I press "Sort"
  Then I should see "Vegans ONLY!" before "Dinner on Main St"
  And I should see "Dinner on Main St" before "Food Co-op: Wednesday Lunch"
  And I should see "Food Co-op: Wednesday Lunch" before "Who Wants Some Grub?"
  