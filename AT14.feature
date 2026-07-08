Feature: View Hemoglobin Control History

  As a nurse
  I want to review a patient's hemoglobin control history
  So that I can monitor the patient's hemoglobin evolution over time.

  Background:
    Given the nurse is authenticated
    And the nurse has at least one assigned patient
    And the selected patient has a medical record
    And the nurse is viewing the patient's medical record summary

  Scenario: View the hemoglobin control history
    Given the patient has registered hemoglobin controls
    When the nurse selects the "View Hemoglobin History" option
    Then the hemoglobin history should be displayed
    And all registered hemoglobin controls should be listed
    And the patient's hemoglobin evolution should be displayed
    And the average hemoglobin value should be displayed
    And a button to register a new hemoglobin control should be available

  Scenario: Register the first hemoglobin control
    Given the patient has a medical record
    And no hemoglobin controls have been registered
    When the nurse selects the "Register First Hemoglobin Control" button
    Then the nurse should be redirected to the New Hemoglobin Control page

  Scenario: Register a new hemoglobin control from the history
    Given the patient already has registered hemoglobin controls
    When the nurse selects the "New Hemoglobin Control" button
    Then the nurse should be redirected to the New Hemoglobin Control page
