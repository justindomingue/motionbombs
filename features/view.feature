Feature: View counter for Videos

  As a visitor, user, admin
  I want to increment views when I visit a video
  So that a can see the number of views and popularity
  
  Scenario: Visitor visits for the 1st time
    Given I have not visited a video
    When I visit its path
    Then the view count increments
    
  Scenario: Visitor visits for the second time
    Given I have already visited a video
    When I visit its path again
    Then the view count does not increments