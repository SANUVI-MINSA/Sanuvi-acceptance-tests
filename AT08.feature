Feature: View Facilities Analytics

  As an administrator
  I want to view facilities metrics
  So that I can identify risk levels

  Scenario: Get facilities analytics successfully
    Given I am authenticated as an administrator
    When I send a GET request to "/api/analytics/facilities"
    Then the response status should be 200
    And the response body should contain:
    """
    {
      "facilities": [
        {
          "facilityName": "Posta Canto Grande",
          "adherenceRate": 85.5,
          "riskLevel": "LOW"
        }
      ]
    }
    """
