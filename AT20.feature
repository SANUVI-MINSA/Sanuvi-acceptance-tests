Feature: Chat Communication

  As a nurse
  I want to communicate with the patient's mother
  So that I can resolve her questions and close the consultation.

  Background:
    Given the nurse is authenticated
    And an open consultation exists

  Scenario: Send a message
    Given the chat conversation is open
    When the nurse writes a message
    And sends the message
    Then the message should appear in the conversation
    And the mother should receive the message

  Scenario: Receive a message
    Given the consultation remains open
    When the patient's mother sends a message
    Then the nurse should receive the new message
    And the conversation should be updated

  Scenario: Close a consultation
    Given the patient's questions have been resolved
    When the nurse selects the "Close Consultation" option
    And confirms the action
    Then the consultation status should change to Closed
    And the consultation should no longer appear in the list of open consultations