Feature: display list of events
 
  As a user
  So that I can see my choices for eating food 
  I want to be able to view all events on a homepage.

Background: events have been added to the database

  Given the following events exist:
  | name                         | date         |
  | Who Wants Some Grub?         | 25-Nov-2017  |
  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  |
  | Vegans ONLY!                 | 21-Jul-2017  |
  | Dinner on Main St            | 10-Aug-2017  |


  And  I am on the BUMS home page
  
Scenario: See Events on home page
  When I go to the home page
  Then I should see "Who Wants Some Grub?"
  And I should see "Food Co-op: Wednesday Lunch"
  And I should see "Vegans ONLY!"
  And I should see "Dinner on Main St"
  