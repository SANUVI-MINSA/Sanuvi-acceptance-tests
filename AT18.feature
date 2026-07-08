Feature: Assign Patient to Nurse

  As a nurse
  I want to assign patients to my portfolio
  So that I can monitor their treatment and clinical progress.

  Background:
    Given the nurse is authenticated
    And the nurse is on the Patients page

  Scenario: Successfully assign an unassigned patient
    Given a mother is registered in the system
    And the mother has at least one patient without an assigned nurse
    When the nurse searches the mother using her DNI
    And selects the mother from the search results
    Then all of the mother's patients should be displayed
    And each patient should display their assignment status
    When the nurse selects a patient with status "Unassigned"
    And confirms the assignment
    Then the patient should be assigned to the nurse
    And the patient's status should change to "Assigned"

  Scenario: Mother has both assigned and unassigned patients
    Given a mother has patients with status "Assigned" and "Unassigned"
    When the nurse searches the mother using her DNI
    And selects the mother
    Then all patients should be displayed
    And patients with status "Assigned" should not be assignable
    And patients with status "Unassigned" should be available for assignment

  Scenario: Mother has no registered patients
    Given a mother is registered in the system
    And the mother has no registered patients
    When the nurse searches the mother using her DNI
    And selects the mother
    Then an informative message should indicate that the mother has no registered patients

  Scenario: Mother is not found
    Given no mother exists with the entered DNI
    When the nurse searches using the entered DNI
    Then an informative message should indicate that no mother was found