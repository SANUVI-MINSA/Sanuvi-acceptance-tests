Feature: Generate Treatment Adherence Report

  As a nurse
  I want to generate an adherence report
  So that I can monitor patient progress

  Scenario: Generate adherence report successfully
    Given a patient with treatment records
    When the nurse requests the adherence report
    Then the system returns the adherence percentage
