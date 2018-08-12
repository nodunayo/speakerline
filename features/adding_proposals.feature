Feature: Adding a Proposal

  Scenario: Filling out the 'Add a Proposal' form
    Given there is a speaker called 'Saron Yitbarek'
    And I am on the 'Add a Proposal' page
    When I add her proposal with the following information:
      | title | Reading Code Good                |
      | body  | Come learn how to read code good |
    And I visit the proposal page for 'Reading Code Good'
    Then I should see 'Come learn how to read code good'
