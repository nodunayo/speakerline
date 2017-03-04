Feature: Adding an Event

  @wip
  Scenario: Adding an event to a proposal
    Given there is a proposal called 'Reading Code Good'
    And I am on the 'Add an Event' page
    When I add an event with the following information:
      | name | RailsConf |
      | year | 2014      |
    And I visit the proposal page for 'Reading Code Good'
    When I add that the proposal was accepted for RailsConf in 2014
    Then I should see a record of the RailsConf 2014 acceptance
