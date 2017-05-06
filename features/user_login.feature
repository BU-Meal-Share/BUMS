Feature: user login
  
    As a user,
    so that I can easily login,
    I want to be able to login through Google

Background:

  Given I am on the BUMS home page
  
@omniauth_test
Scenario: a user can log into google
  Given I am signed in with google
  Then I should see "googleuser"

@omniauth_test
Scenario: a user logs out
  Given I am signed in with google
  And I should see "googleuser"
  And I follow "Sign out"
  Then I should see "Sign in with Google"
  
