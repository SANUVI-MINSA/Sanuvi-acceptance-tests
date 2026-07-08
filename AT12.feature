Feature: Update Medical Record

  As a nurse
  I want to update a patient's medical record
  So that the patient's information remains up to date.

  Background:
    Given the nurse is authenticated
    And the nurse is on the Medical Records page

  Scenario: Successfully update a medical record
    Given the patient has a medical record
    When the nurse edits the medical information
    And saves the changes
    Then the medical record should be updated successfully