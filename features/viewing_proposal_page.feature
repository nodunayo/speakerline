Feature: Proposal Page

  Scenario: Viewing all proposal titles
    Given there is a proposal called 'A Wonderful Proposal'
    When I visit the proposals page
    Then I should see 'A Wonderful Proposal'

  Scenario: Viewing a proposal body
    Given the speaker 'Saron Yitbarek' is in the directory
    And she has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good'
    When I visit the proposal page for 'Reading Code Good'
    Then I should see 'Come learn how to read code good'

  Scenario: Viewing where a proposal has been accepted or rejected
    Given the speaker 'Saron Yitbarek' is in the directory
    And she has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good'
    And 'Reading Code Good' was accepted for 'RailsConf' in 2014
    When I visit the proposal page for 'Reading Code Good'
    Then I should see a record of the 'RailsConf' 2014 acceptance

  Scenario: Adding a submission to a proposal
    Given I am logged in
    And there is an event called 'Boo Ruby' that has an instance for the year 2017
    And I have a proposal called 'Reading Code Good'
    When I visit the proposal page for 'Reading Code Good'
    And I add that the proposal was rejected for 'Boo Ruby' in 2017
    Then I should see a record of the 'Boo Ruby' 2017 rejection
