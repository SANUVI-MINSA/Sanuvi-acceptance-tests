
Feature: View Badges

  As a mother
  I want to view my badges
  So that I can track my achievements

  Scenario: Get badges successfully
    Given I am authenticated as a mother
    When I send a GET request to "/api/achievements-rewards/patients/{patientId}/badges"
    Then the response status should be 200
    And the response body should contain:
    """
    {
      "patientId": "uuid",
      "patientName": "Mateo Pérez",
      "badges": [
        {
          "type": "FIRST_WEEK",
          "isUnlocked": true,
          "progress": 100
        }
      ]
    }
    """
