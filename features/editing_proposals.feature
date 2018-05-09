Feature: Editing a Proposal

Scenario: Editing an existing proposal
  Given there is a speaker called 'Saron Yitbarek'
  And she has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good'
  When I visit the proposal page for 'Reading Code Good'
  And I click 'Edit Proposal'
  And I change the title to 'Reading Code Well'
  And I click 'Update Proposal'
  Then I should see 'Reading Code Well'
  And I should not see 'Reading Code Good'

