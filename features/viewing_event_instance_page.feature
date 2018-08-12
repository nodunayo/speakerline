Feature: Event instance page

  Scenario: Viewing an event instance page
    Given there is a proposal called 'This is a great talk'
    And 'This is a great talk' was accepted for 'Boo Ruby' in 2017
    When I am on the 'Boo Ruby' event instance page for the year 2017
    Then I should see 'This is a great talk'
    And I should see a link to the main 'Boo Ruby' event page
