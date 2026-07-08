Feature: Consultation Inbox

  As a nurse
  I want to manage consultations sent by patients' mothers
  So that I can answer their questions.

  Background:
    Given the nurse is authenticated
    And the nurse is on the Consultation Inbox page

  Scenario: View consultation inbox
    Given mothers have sent consultations
    When the nurse opens the Consultation Inbox
    Then all open consultations should be displayed

  Scenario: Open a consultation
    Given an open consultation exists
    When the nurse selects the consultation
    Then the chat conversation should be displayed

  Scenario: Nurse has no assigned patients
    Given the nurse has no assigned patients
    When the nurse opens the Consultation Inbox
    Then an empty state should be displayed
    And a button to assign patients should be available
    When the nurse selects the assign patients option
    Then the system should redirect the nurse to the Patients section

  Scenario: There are no consultations
    Given no consultations have been sent
    When the nurse opens the Consultation Inbox
    Then the consultation list should be empty
    And an informative message should be displayed