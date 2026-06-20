Feature: View Achievement Progress

  As a mother
  I want to view my treatment progress
  So that I can track my adherence

  Scenario: Get achievement progress successfully
    Given I am authenticated as a mother
    When I send a GET request to "/api/achievements-rewards/patients/{patientId}/achievement"
    Then the response status should be 200
    And the response body should contain:
    """
    {
      "patientId": "uuid",
      "patientName": "Mateo Pérez",
      "status": "ACTIVE",
      "totalPoints": 70,
      "currentStreak": 7,
      "longestStreak": 30
    }
    """
