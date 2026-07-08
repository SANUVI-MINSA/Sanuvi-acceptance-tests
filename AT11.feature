Feature: Register Medical Record

  As a nurse
  I want to register a patient's medical record
  So that the patient's clinical information is stored for future follow-up.

  Background:
    Given the nurse is authenticated
    And the nurse is on the Medical Records page

  Scenario: Successfully register a medical record
    Given the nurse has at least one assigned patient
    And the selected patient does not have a medical record
    When the nurse completes the medical record form
    And submits the information
    Then the medical record should be created successfully
    And a confirmation message should be displayed

  Scenario: Patient already has a medical record
    Given the nurse has at least one assigned patient
    And the selected patient already has a medical record
    When the nurse selects the patient
    Then the medical record summary should be displayed
    And the nurse should be able to update the medical record

  Scenario: Nurse has no assigned patients
    Given the nurse has no assigned patients
    When the nurse accesses the Medical Records section
    Then an empty state should be displayed
    And a button to assign patients should be available
    When the nurse selects the assign patients option
    Then the system should redirect the nurse to the Patients section