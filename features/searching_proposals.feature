Feature: Search Proposals

  Scenario: Search the proposals list
    Given the speaker 'Kathyrn Keebler' is in the directory
    And she has a proposal called 'Hotwire is the future' with the body 'Come learn about how cool hotwire is'
    And she has a proposal called 'JavaScript is rough' with the body 'I do not like it'
    And I visit the proposals page
    When I search proposals with the following information:
      | search | Hotwire |
    Then I should see 'Hotwire is the future'
    And I should not see 'JavaScript is rough'