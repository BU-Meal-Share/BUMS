Feature: remember params
  
    As a user,
    So I don't have to re enter my sorting and filtering options
    I should be able to see them saved on the website.
    
Background:  events have been added to the database
  
   Given the following events exist:
  | name                         | date         | description        | ingredients |
  | Who Wants Some Grub?         | 25-Nov-2017  | not the bootloader | grubs       |
  
    Given I am on the BUMS home page

Scenario: Save filter criteria through refresh 
    When I fill in "start" with "25-Nov-2015"
    And I fill in "end" with "25-Nov-2019"
    And I press "Filter"
    And I am on the BUMS home page
    Then the "start" field should contain "25-Nov-2015"
    And the "end" field should contain "25-Nov-2019"

Scenario: Save filter criteria through page change
    When I fill in "start" with "25-Nov-2015"
    And I fill in "end" with "25-Nov-2019"
    And I press "Filter"
    And I follow "Who Wants Some Grub?"
    And I follow "Back to Home"
    Then the "start" field should contain "25-Nov-2015"
    And the "end" field should contain "25-Nov-2019"

Scenario: Save sort criteria through refresh
    When I check "option_name"
    And I press "Sort"
    And I am on the BUMS home page
    Then the "option_name" checkbox should be checked
    
Scenario: Save sort criteria through page change
    When I check "option_name"
    And I press "Sort"
    And I follow "Who Wants Some Grub?"
    And I follow "Back to Home"
    Then the "option_name" checkbox should be checked