Feature: Event instance page

  Scenario: Viewing an event instance page
    Given there is a proposal called 'This is a great talk' that has been submitted to 'Boo Ruby 2017'
    When I am on the 'Boo Ruby' event instance page for the year 2017
    Then I should see the proposal 'This is a great talk'
    And I should see a link to the main 'Boo Ruby' event page
