Feature: Users can attend events
  
    As a user,
    So that I am able to attend an event
    I should be able to RSVP to an event
    
Background: events have been added to the database

  Given the following events exist:
  | id | name                         | date         | description | ingredients  | minPartySize | curPartySize | maxPartySize | location | recipes        | image  | ethnicity          | dietary_restrictions | category            |
  | 5  | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1            | 3            | 6            | my house | ants with lime | 42.jpg | {"asian":"1"}     | {"kosher" : "1"}      | {"cafe":"1"}       | 
  | 6  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1            | 2            | 3            | n/a      | n/a            | 2.jpg  | {"indian":"1"}    | {"other":"1"}       | {"restaurant":"1"} |
  | 7  | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1            | 2            | 3            | n/a      | n/a            | 3.jpg  | {"african":"1"}   | {"vegan":"1"}       | {"potluck":"1"}    |
  | 8  | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1            | 2            | 3            | n/a      | n/a            | 4.jpg  | {"french":"1"}    | {"keto":"1"}        | {"dinner":"1"}     |  

  And the following users exist:
  | id | name    | oauth_token |
  | 5  | Joe     | 1234        |
  | 6  | Tom     | 5678        |
  | 7  | Xinghao | 9ABC        |
  | 8  | Yixian  | DEF0        |

  And the following attendees exist:
  | id | user_id | event_id |
  | 1  | 6       | 5        |
  | 2  | 7       | 5        |
  | 3  | 8       | 5        |

  And I am on the BUMS home page
  
Scenario: Viewing List of Attendees
  When I follow "Who Wants Some Grub?"
  Then I should see "Tom"
  
Scenario: Viewing Attend Event Link and not Nevermind Link Without Login
  When I follow "Who Wants Some Grub?"
  Then I should see "Attend Event?"
  And I should not see "Nevermind?"

Scenario: Viewing Login Required  
  When I follow "Who Wants Some Grub?"
  And I follow "Attend Event?"
  Then I should see "You must be logged in to Attend an event."
  
@omniauth_test
Scenario: Attending an Event
  Given I am signed in with google
  When I follow "Who Wants Some Grub?"
  And I follow "Attend Event?"
  Then I should see "googleuser"
  
@omniauth_test
Scenario: See Nevermind Button When Already Attending
  Given I am signed in with google
  When I follow "Who Wants Some Grub?"
  And I follow "Attend Event?"
  Then I should see "Nevermind?"
  And I should not see "Attend Event?"

@omniauth_test
Scenario: Remove self from Event
  Given I am signed in with google
  When I follow "Who Wants Some Grub?"
  And I follow "Attend Event?"
  And I follow "Nevermind?"
  Then I should not see "googleuser"
  