Feature: Speaker Directory

  Scenario: View speakers in the directory
    Given the speaker 'Sandi Metz' is in the directory
    When I go to the speaker directory page
    Then I should see 'Sandi Metz'

  Scenario: Go to a speaker's page
    Given 'Sandi Metz' has a proposal entitled 'All The Little Things'
    When I go to the speaker directory page
    And I click on 'Sandi Metz'
    Then I should see 'All The Little Things'

  Scenario: Add a speaker to the directory
    Given the speaker 'Katrina Owen' is not in the directory
    When I add 'Katrina Owen' to the directory
    And I go to the speaker directory page
    Then I should see 'Katrina Owen'

