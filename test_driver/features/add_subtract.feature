Feature: AddFeature
  Test the Add button

  Scenario: Test Add button in the Flutter app
    Given I check the initial state of the app with value "0"
    And I click the plus button
    Then I see if the value is "1"