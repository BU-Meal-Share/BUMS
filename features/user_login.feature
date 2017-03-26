Feature: Users should exist
  
As a user,
So that my activities are recorded,
I want to be able to login.

Background:
  Given I am on the BUMS home page
  And the following users exist: 
    | name | password |
    | tmodell | helloworld |
 
Scenario: View Login Page
  When I follow "Login"
  Then I should see "Username:"
  And I should see "Password:"

# Scenario: Successful Login
#   When I follow "Login"
#   And I fill in the following:
#     |Username | tmodell |
#     |Password  | helloworld |
#   Then I press "Login" 
#   And I should see "Welcome tmodell"

# Scenario: Unsuccessful Login
#   When I follow "Login"
#   And I fill in the following:
#     |Username | tmodell |
#     |Password  | fail |
#   Then I press "Login" 
#   Then I should see "Login Unsuccessful"
