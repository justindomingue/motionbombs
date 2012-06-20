Feature: User registers

  In order to have an account
  As a user
  I want to be able to register
  
  Scenario: User registers (success)
    Given I am on the register page
    When I fill the register form correctly
    Then I should see "registered."
    And I should be on root
    
  Scenario: User registers (failure)
    Given I am on the register page
    When I fill the register form uncorrectly
    Then I should see "error"
    And I should be on register
   