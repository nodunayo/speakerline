Feature: Proposal Page

  Background:
    Given there is a speaker called 'Saron Yitbarek' who has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good.'
    And I am on Saron Yitbarek's speaker page

  Scenario: View speakers in the directory
    When I click on 'Reading Code Good'
    Then I should see 'Come learn how to read code good'
    
