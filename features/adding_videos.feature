Feature: User adds video
  In order to participate in the site's activity
  As a User
  I want to add videos
  
  Scenario: Add video
    Given I am on the add video page
    When I fill in the form
    Then I should see 'Video added'
    And I should be on the new video page