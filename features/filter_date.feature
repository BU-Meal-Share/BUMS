Feature: display list of events between two dates
  
    As a busy user,
    So that I can plan my weekend,
    I should be able to filter events by date.
    
Background: events have been added to the database
  
   Given the following events exist:
  | name                         | date         | description | ingredients |
  | Who Wants Some Grub?         | 25-Nov-2017  | foo         | bar         |
  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | bar         |
  | Vegans ONLY!                 | 21-Jul-2017  | foo         | bar         |
  | Dinner on Main St            | 10-Aug-2017  | foo         | bar         |

  And  I am on the BUMS home page
  
Scenario: See Events filtered by date on home page
    When I fill in "start" with "15-Sep-2017"
    And I fill in "end" with "10-Dec-2017"
    And I press "Filter"
    Then I should see "Food Co-op: Wednesday Lunch"
    And I should see "Who Wants Some Grub?"
    And I should not see "Vegans ONLY!"
    And I should not see "Dinner on Main St"