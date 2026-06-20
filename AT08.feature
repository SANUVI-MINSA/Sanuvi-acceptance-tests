Feature: Appointment History

  As a mother
  I want to view appointment history
  So that I can track previous visits

  Scenario: View appointment history
    Given previous appointments exist
    When history is requested
    Then all appointments are returned
