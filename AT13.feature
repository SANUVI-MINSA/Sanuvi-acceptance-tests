Feature: Register Hemoglobin Control

  As a nurse
  I want to register a patient's hemoglobin control
  So that I can monitor the patient's health.

  Background:
    Given the nurse is authenticated
    And the nurse is on the Hemoglobin Control page

  Scenario: Successfully register a hemoglobin control
    Given the patient has a medical record
    When the nurse registers a hemoglobin value
    Then the hemoglobin control should be saved successfully

  Scenario: Patient does not have a medical record
    Given the patient does not have a medical record
    When the nurse attempts to register a hemoglobin control
    Then the system should redirect the nurse to the Medical Record section

  Scenario: Nurse has no assigned patients
    Given the nurse has no assigned patients
    When the nurse opens the Hemoglobin Control section
    Then an empty state should be displayed
    And the nurse should be redirected to the Patients section