Feature: Discharge Patient

  As a nurse
  I want to discharge a patient
  So that the patient completes the treatment process successfully.

  Background:
    Given the nurse is authenticated
    And the nurse is on the Discharge Patients page

  Scenario: Successfully discharge a patient
    Given the nurse has at least one assigned patient
    And the selected patient has completed the treatment
    When the nurse confirms the discharge
    Then the patient should be discharged successfully
    And the patient should no longer appear in the discharge list

  Scenario: Nurse has no assigned patients
    Given the nurse has no assigned patients
    When the nurse opens the Discharge Patients page
    Then an empty state should be displayed
    And a button to assign patients should be available
    When the nurse selects the assign patients option
    Then the system should redirect the nurse to the Patients section

  Scenario: There are no patients available for discharge
    Given all assigned patients have already been discharged
    When the nurse opens the Discharge Patients page
    Then the discharge list should be empty
    And an informative message should be displayed