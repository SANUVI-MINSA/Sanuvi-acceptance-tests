
Feature: Analytics Dashboard Summary

  As an administrator
  I want to view analytics metrics
  So that I can monitor health facilities

  Scenario: Get dashboard summary successfully
    Given I am authenticated as an administrator
    When I send a GET request to "/api/analytics/dashboard/summary"
    Then the response status should be 200
    And the response body should contain:
    """
    {
      "totalActiveFacilities": 4,
      "totalCriticalFacilities": 2,
      "globalAdherenceRate": 54.25
    }
    """
