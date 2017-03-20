Feature: create an event
 
 As a user, 
 so that I can cook my food and share it with others, 
 I want to be able to create an event.
 
Scenario: Navigating to Event Creation Page
    Given I am on the BUMS home page
    When I follow "Create new event"
    Then I should see "Create New Event"
    And I should see "Event Title"
    And I should see "Event Date"
    And I should see "Event Description"
    And I should see "Ingredients/Recipe"

Scenario: Creating an Event
    Given I am on the create page
    When I fill in "Event Title" with "Test Event"
    And I fill in "2017-11-01" for "date"
    And I fill in "Event Description" with "Test Description"
    And I fill in "Ingredients/Recipe" with "Test Recipe"
    When I press "Save"
    Then I should be on the BUMS home page
    Then I should see "Event created"
    And I should see "Test Event"