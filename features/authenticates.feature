Feature: User logs in

  In order to manage my account and participate in the website
  As a user
  I want to be able to log in
  
  Scenario: User logs in (success)
    Given I am on the login page
    And I am registered
    When I fill the login form correctly
    Then I should see "Login successful"
    And I should be on root
    
  Scenario: User logs in (failure)
    Given I am on the login page
    And I am registered
    When I fill the login form uncorrectly
    Then I should see "Login failed"
    And I should be on login
    
  