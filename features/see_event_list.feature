Feature: display list of events
 
  As a user
  So that I can see my choices for eating food 
  I want to be able to view all events on a homepage.

Background: events have been added to the database

  Given the following events exist:
  | name                         | date         | description | ingredients |
  | Who Wants Some Grub?         | 25-Nov-2017  | foo         | bar         |
  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | bar         |
  | Vegans ONLY!                 | 21-Jul-2017  | foo         | bar         |
  | Dinner on Main St            | 10-Aug-2017  | foo         | bar         |

  And  I am on the BUMS home page
  
Scenario: See Events on home page
  When I go to the BUMS home page
  Then I should see all the events
  And I should see "Who Wants Some Grub?"
  And I should see "Food Co-op: Wednesday Lunch"
  And I should see "Vegans ONLY!"
  And I should see "Dinner on Main St"
  