Feature: Start Treatment

  As a nurse
  I want to start a patient's treatment
  So that treatment monitoring can begin.

  Background:
    Given the nurse is authenticated
    And the nurse is on the Start Treatment page

  Scenario: Successfully start treatment
    Given there is a patient waiting for treatment
    When the nurse configures the treatment
    And confirms the treatment
    Then the treatment should become active
    And the patient should no longer appear in the pending patients list

  Scenario: Nurse has no assigned patients
    Given the nurse has no assigned patients
    When the nurse opens the Start Treatment page
    Then an empty state should be displayed
    And the nurse should be redirected to the Patients section
    And the nurse should assign a patient before starting a treatment

  Scenario: All assigned patients already started treatment
    Given all assigned patients already have an active treatment
    When the nurse opens the Start Treatment page
    Then the pending patients list should be empty

  Scenario: Patient has an abandoned treatment
    Given a patient has an abandoned treatment
    When the nurse opens the Start Treatment page
    Then the patient should appear in the pending patients list
    When the nurse starts the treatment again
    Then the treatment should become active
