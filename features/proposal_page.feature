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
