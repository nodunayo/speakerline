Feature: Adding a Proposal

  Scenario: Filling out the 'Add a Proposal' form
    Given I am logged in
    And I am on the 'Add a Proposal' page
    When I add a proposal with the following information:
      | title | Reading Code Good                |
      | body  | Come learn how to read code good |
      | tags  | studying, groups, friends |
    And I visit the proposal page for 'Reading Code Good'
    Then I should see 'Come learn how to read code good'
    And I should see the tags
