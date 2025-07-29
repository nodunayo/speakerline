Feature: Speaker Directory

  Scenario: Go to a speaker's page
    Given the speaker 'Sandi Metz' is in the directory
    And she has a proposal called 'All The Little Things' with the body 'Great talk'
    When I go to the speaker directory page
    And I click on 'Sandi Metz'
    Then I should see 'All The Little Things'

  Scenario: Speakers without proposals do not appear in the directory
    Given the speaker 'Lazy Ted' is in the directory
    And he does not have any proposals
    When I go to the speaker directory page
    Then I should not see 'Lazy Ted'
