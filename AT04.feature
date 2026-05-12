Feature: Nurse assigns a patient to herself
  As a nurse I want to assign a patient to my care so I can follow up on their treatment

  Background:
    Given the system has a nurse "nurse_1" with password "NursePass123"
    And the system has a patient "patient-123" registered
    And I am authenticated as that nurse

  Scenario: Nurse assigns patient successfully
    When I POST "/api/patients/assign-nurse" with body:
      """
      {
        "patientId": "patient-123"
      }
      """
    Then the response status is 200
    And the JSON at "$.message" = "Nurse assigned successfully"
    And the JSON at "$.nurseId" exists

  Scenario: Nurse tries to assign already assigned patient
    Given the patient "patient-123" is already assigned to another nurse
    When I POST "/api/patients/assign-nurse" with body:
      """
      { "patientId": "patient-123" }
      """
    Then the response status is 400
    And the JSON at "$.error" contains "already assigned"