Feature: third party authentication with google

As a user,
So that my activities are recorded,
I want to be able to login through a third party.

Background:
  Given I am on the BUMS home page
 
Scenario: View Login Page
  When I follow "Sign in with Google"
  Then I should see "Username:"
  And I should see "Password:"

Scenario: Successful Login
  When I follow "Login"
  And I fill in the following:
    |Username | tmodell |
    |Password  | helloworld |
  Then I should see "Welcome tmodell"

Scenario: Unsuccessful Login
  When I follow "Login"
  And I fill in the following:
    |Username | tmodell |
    |Password  | fail |
  Then I should see "Login Unsuccessful"