Feature: User can see a scrible

  Scenario: See the scrible page
    Given a scrible called "tester scrible"
    When I am on the show page of the "scrible"
    Then I should see the "question" for the scrible
    And I should see the  "graph" for the scrible
    And I should see the "comments/branches" for the scrible
    And I should see the "poll" for the question
    And I should see the "tags for" the scrible
    And I should see the "text" for the scrible
    And I should see "similar" scribles for the scrible

