Feature: Speaker Directory

  Scenario: View speakers in the directory
    Given the speaker 'Sandi Metz' is in the directory
    When I go to the speaker directory page
    Then I should see 'Sandi Metz'
