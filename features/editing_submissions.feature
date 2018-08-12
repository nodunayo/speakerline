Feature: Editing submissions

  Scenario: Editing an existing submission
    Given there is a speaker called 'Saron Yitbarek'
    And she has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good'
    And 'Reading Code Good' was accepted for 'RailsConf' in 2014
    When I visit the proposal page for 'Reading Code Good'
    And I edit the submission to 'rejected'
    Then I should be on the 'Reading Code Good' page
    And I should see a record of the 'RailsConf' 2014 rejection
