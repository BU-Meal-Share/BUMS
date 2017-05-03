Feature: delete an event
 
    As a user,
    So that I can deal with my conflict or issue that arises,
    I want to be able to cancel an event.

Background: events have been added to the database

  Given the following events exist:
  | name                         | date         | description | ingredients  | user_id |
  | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1       |
  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1       |  
  | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1       |
  | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1       |

  And  I am on the BUMS home page

@omniauth_test   
Scenario: Canceling An Event
  Given I am signed in with google
  And I am on the Event Page for "Vegans ONLY!"
  When I press "Cancel Event"
  Then I should be on the BUMS home page
  And I should see "Event 'Vegans ONLY!' deleted"
  And I should not see "Vegans ONLY!" after "Event Title"