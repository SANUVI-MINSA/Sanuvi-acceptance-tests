Feature: Confirm Daily Dose

  As a mother
  I want to confirm today's dose
  So that treatment adherence is updated

  Scenario: Confirm dose successfully
    Given I am authenticated as a mother
    When I send a POST request to "/api/treatment-tracking/doses/confirm"
    Then the response status should be 200
    And the response body should contain:
    """
    {
      "message": "Dose confirmed successfully",
      "dose": {
        "status": "CONFIRMED"
      }
    }
    """
