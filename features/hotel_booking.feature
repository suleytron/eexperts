Feature: Using the hotel booking system

  Scenario: Make a correct booking
    Given I am on the booking page
    When I enter correct details
    Then I will see my booking appear
