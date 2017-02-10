Feature: Proposal Page

  Scenario: Viewing a proposal body
    Given there is a speaker called 'Saron Yitbarek' who has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good.'
    And I am on Saron Yitbarek's speaker page
    When I click on 'Reading Code Good'
    Then I should see 'Come learn how to read code good'
    
  Scenario: Viewing where a proposal has been accepted or rejected
    Given Saron Yitbarek's 'Reading Code Good' was accepted at RailsConf 2014
    And I am on Saron Yitbarek's speaker page
    When I click on 'Reading Code Good'
    Then I should see a record of the RailsConf 2014 acceptance

  Scenario: Adding a submission to a proposal
    Given there is an 2017 event called "Boo Ruby" in the system
    And there is a proposal called 'Reading Code Good'
    And I am on the 'Reading Code Good' page
    When I add that the proposal was rejected from Boo Ruby in 2017
    Then I should see a record of the Boo Ruby 2017 rejection
