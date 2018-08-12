Feature: Editing a Proposal

  Scenario: Editing an existing proposal
    Given there is a speaker called 'Saron Yitbarek'
    And she has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good'
    When I visit the proposal page for 'Reading Code Good'
    And I click on 'Edit proposal'
    And I change the title to 'Reading Code Well'
    And I click on 'Update proposal'
    Then I should see 'Reading Code Well'
    And I should not see 'Reading Code Good'

