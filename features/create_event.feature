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
    When I fill in "Event Title" with "Test Event Title"
    When I select date field "Event Date" with "01-Nov-2017"
    When I fill in "Event Description" with "Test Event description"
    When I fill in "Ingredients" with "Test, text, of, ingredients"
    When I press "Save"
    Then I should be on the BUMS home page
    And I should see "Test Event Title was successfully created"
    #checks for flash message, but not for event persisted in database. Is this covered by rspec controller testing?