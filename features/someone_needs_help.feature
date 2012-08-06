Feature: someone wants help
  
  In order to get help
  Someone
  Wants to contact the administrator
  
  Scenario: asks for help
    Given I am on the help page
    When I fill the contact form
    Then I create a new help ticket