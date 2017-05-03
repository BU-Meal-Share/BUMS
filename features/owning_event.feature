Feature: owning events
  
    As a user,
    so that so that no one else can delete or edit my event,
    I want to be able to own an event

Background:
  Given the following events exist:
    | name                         | date         | description | ingredients  | minPartySize | curPartySize | maxPartySize | tags  | location | recipes        | image  | user_id |
    | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1            | 3            | 6            | #ants | my house | ants with lime | 42.jpg | 1       | 
    | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1            | 2            | 3            | n/a   | n/a      | n/a            | 2.jpg  | 1       |
    | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1            | 2            | 3            | n/a   | n/a      | n/a            | 3.jpg  | 2       |
    | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1            | 2            | 3            | n/a   | n/a      | n/a            | 4.jpg  | 2       |

  And I am on the BUMS home page
  
@omniauth_test
Scenario: A user can edit an event if user is the owner
  Given I am signed in with google
  Then I should see "googleuser"
  When I follow "Who Wants Some Grub?"
  Then I should see "Edit"
  
@omniauth_test
Scenario: A user cannot edit an event if user is not the owner
  Given I am signed in with google
  Then I should see "googleuser"
  When I follow "Vegans ONLY!"
  Then I should not see "Edit"
  
@omniauth_test
Scenario: A user can delete an event if user is the owner
  Given I am signed in with google
  Then I should see "googleuser"
  When I follow "Who Wants Some Grub?"
  When I press "Cancel Event"
  Then I should be on the BUMS home page
  And I should see "Who Wants Some Grub?' deleted"
  And I should not see "Who Wants Some Grub?" after "Event Title"
  
@omniauth_test
Scenario: A user cannot delete an event if user is not the owner
  Given I am signed in with google
  Then I should see "googleuser"
  When I follow "Vegans ONLY!"
  When I press "Cancel Event"
  Then I should be on the BUMS home page
  And I should not see "Vegans ONLY!' deleted"
  And I should see "Vegans ONLY!" after "Event Title"