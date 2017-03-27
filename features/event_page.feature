Feature: Event page

  Scenario: Viewing a list of proposals submitted to an event
    Given there is a proposal called 'This is a great talk' that has been submitted to 'Boo Ruby 2017'
    When I am on the 'Boo Ruby 2017' event page
    Then I should see 'This is a great talk'
