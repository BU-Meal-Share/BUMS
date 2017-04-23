Feature: Users can attend events
  
    As a user,
    So that I am able to attend an event
    I should be able to RSVP to an event
    
Background: events have been added to the database

  Given the following events exist:
  | id | name                         | date         | description | ingredients  | minPartySize | curPartySize | maxPartySize | tags | location | recipes        | image  |
  | 5  | Who Wants Some Grub?         | 25-Nov-2017  | foo         | ants, grubs  | 1            | 3            | 6            | ants | my house | ants with lime | 42.jpg |
  | 6  | Food Co-op: Wednesday Lunch  | 26-Oct-2017  | foo         | piza, pasta  | 1            | 2            | 3            | n/a  | n/a      | n/a            | 2.jpg  |
  | 7  | Vegans ONLY!                 | 21-Jul-2017  | foo         | tofu, squash | 1            | 2            | 3            | n/a  | n/a      | n/a            | 3.jpg  |
  | 8  | Dinner on Main St            | 10-Aug-2017  | foo         | n/a          | 1            | 2            | 3            | n/a  | n/a      | n/a            | 4.jpg  |

  And the following users exist:
  | id | name    | oauth_token |
  | 1  | Joe     | 1234        |
  | 2  | Tom     | 5678        |
  | 3  | Xinghao | 9ABC        |
  | 4  | Yixian  | DEF0        |

  And the following attendees exist:
  | id | user_id | event_id |
  | 1  | 2       | 5        |
  | 2  | 3       | 5        |
  | 3  | 4       | 5        |

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
  