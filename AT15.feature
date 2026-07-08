Feature: Download Medical Record and Hemoglobin Report PDF

  As a nurse
  I want to download the patient's medical record and hemoglobin report
  So that I can print or share the patient's clinical information.

  Background:
    Given the nurse is authenticated

  Scenario: Successfully download the medical record PDF
    Given the nurse has an assigned patient
    And the patient has a medical record
    When the nurse selects the download medical record option
    Then the system should generate the medical record PDF
    And the download should start successfully

  Scenario: Successfully download the hemoglobin report PDF
    Given the nurse has an assigned patient
    And the patient has registered hemoglobin controls
    When the nurse selects the download hemoglobin report option
    Then the system should generate the hemoglobin report PDF
    And the download should start successfully