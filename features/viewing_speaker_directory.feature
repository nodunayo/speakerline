Feature: Speaker Directory

  Scenario: View speakers with proposals in the directory
    Given the speaker 'Sandi Metz' is in the directory
    And Sandi already has a proposal
    When I go to the speaker directory page
    Then I should see 'Sandi Metz'

  Scenario: Speakers without proposals do not appear in the directory
    Given the speaker 'Lazy Ted' is in the directory
    And Ted does not have any proposals
    When I go to the speaker directory page
    Then I should not see 'Lazy Ted'

  Scenario: Go to a speaker's page
    Given 'Sandi Metz' has a proposal entitled 'All The Little Things'
    When I go to the speaker directory page
    And I click on 'Sandi Metz'
    Then I should see 'All The Little Things'

  Scenario: Add a speaker to the directory
    Given the speaker 'Katrina Owen' is not in the directory
    When I add 'Katrina Owen' to the directory
    And I create a proposal for Katrina
    And I go to the speaker directory page
    Then I should see 'Katrina Owen'

