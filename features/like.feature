Feature: Like videos

  In order to show appreciation
  As a User
  I want to like and unlike videos
  
  Scenario: User likes a video
    Given I am logged in
    And a video exists
    And I don't like it
    When I click "Like"
    Then I should like
  
  Scenario: User unlikes a video
    Given I am logged in
    And a video exists
    And I like it
    When I click "Unlike"
    Then I should not like it
  
  