Feature: View Treatment Statistics

  As a nurse
  I want to view treatment statistics
  So that I can identify patients at risk

  Scenario: View treatment statistics successfully
    Given treatment data exists
    When the nurse requests treatment statistics
    Then the system returns aggregated indicators
