Feature: Editing a Proposal

Scenario: Editing an Existing proposal
  Given there is a speaker called 'Saron Yitbarek' who has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good.'
  Given I am on the 'Reading Code Good' page
  When I click 'Edit Proposal'
  And I change the title to 'Reading Code Well'
  And I click 'Update Proposal'
  Then I should see 'Reading Code Well'
  And I should not see 'Reading Code Good'

