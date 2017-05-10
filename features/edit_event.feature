Feature: edit an event
 
    As a user
    so that I can change the name of the event
    I want to be able to edit an event.

Background: events have been added to the database

  Given the following events exist:
  | name                         | date         | description | ingredients  | user_id |
  | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1       |
  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1       |
  | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1       |
  | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1       |

  And  I am on the BUMS home page

@omniauth_test  
Scenario: Updating An Event
  Given I am signed in with google
  When I follow "Who Wants Some Grub?"
  Then I should see "Who Wants Some Grub?"
  And I should see "Ingredients: ants, grubs"
  And I should see "Description: foo"
  And I should see "Date: 11/25/2017"
  Then I follow "Edit"
  When I fill in "Event Title" with "testing"
  When I press "Save"
  Then I should be on the BUMS home page
  And I should see "testing was successfully updated"
  And I should see "testing"
  And I should not see "Who Wants Some Grub?"

@omniauth_test  
Scenario: Canceling an edit
  Given I am signed in with google
  When I follow "Who Wants Some Grub?"
  Then I should see "Who Wants Some Grub?"
  And I should see "Ingredients: ants, grubs"
  And I should see "Description: foo"
  And I should see "Date: 11/25/2017"
  Then I follow "Edit"
  Then I follow "Cancel"
  Then I should be on the details page for "Who Wants Some Grub?"
