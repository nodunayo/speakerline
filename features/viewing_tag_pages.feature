Feature: Tag pages

  Scenario: Viewing all proposals with a given tag
    Given there is a proposal called 'A happy talk' with the tag 'fun'
    And there is a proposal called 'A joyous talk' with the tag 'fun'
    And there is a proposal called 'A miserable talk' with the tag 'sad'
    When I visit the 'fun' tag page
    Then I should see 'A happy talk'
    And I should see 'A joyous talk'
    And I should not see 'A miserable talk'

