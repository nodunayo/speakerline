Feature: Editing submissions
  
Scenario: Editing an existing submission
  Given Saron Yitbarek's 'Reading Code Good' was accepted at RailsConf 2014
  When I visit the proposal page for 'Reading Code Good'
  And I click to edit the submission
  And I change the submission to 'rejected'
  Then I should be on the 'Reading Code Good' page
  And I should see a record of the 'RailsConf' 2014 rejection
