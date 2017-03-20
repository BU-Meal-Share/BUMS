Feature: edit an event
 
    As a user
    so that I can change the name of the event
    I want to be able to edit an event.

Background: events have been added to the database

  Given the following events exist:
  | name                         | date         | description | ingredients  |
  | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  |
  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  |
  | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash |
  | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          |

  And  I am on the BUMS home page
  
Scenario: Updating An Event
  When I follow "Who Wants Some Grub?"
  Then I should see "Who Wants Some Grub?"
  And I should see "Ingredients: ants, grubs"
  And I should see "Description: foo"
  And I should see "Date: 25-Nov-2017"
  Then I follow "Edit"
  When I fill in "Event Title" with "testing"
  When I press "Save"
  Then I should be on the BUMS home page
  And I should see "testing was successfully updated"
  And I should see "testing"
  And I should not see "Who Wants Some Grub?"
  
Scenario: Canceling an edit
  When I follow "Who Wants Some Grub?"
  Then I should see "Who Wants Some Grub?"
  And I should see "Ingredients: ants, grubs"
  And I should see "Description: foo"
  And I should see "Date: 25-Nov-2017"
  Then I follow "Edit"
  Then I follow "Cancel"
  Then I should be on the details page for "Who Wants Some Grub?"
