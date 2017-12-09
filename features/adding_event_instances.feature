Feature: Adding an Event Instance

  Scenario: Adding a new event instance for a new event to a proposal
    Given there is a proposal called 'Reading Code Good'
    And there is not an event called 'NuConf'
    And I am on the 'Add an Event' page
    When I add an event instance with the following information:
      | name | NuConf |
      | year | 1985   |
    And I visit the proposal page for 'Reading Code Good'
    When I add that the proposal was accepted for NuConf in 1985
    Then I should see a record of the NuConf 1985 acceptance

  Scenario: Adding a new event instance for an existing event to a proposal
    Given there is a proposal called 'Reading Code Good'
    And there is an event called RailsConf that has an instance for the year 2014
    And I am on the 'Add an Event' page
    When I add an event instance with the following information:
      | name | RailsConf |
      | year | 2015      | 
    And I visit the proposal page for 'Reading Code Good'
    When I add that the proposal was accepted for RailsConf in 2014
    Then I should see a record of the RailsConf 2014 acceptance
