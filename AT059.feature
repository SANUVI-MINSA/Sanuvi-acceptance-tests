Feature: Start Treatment

  As a nurse
  I want to start a treatment
  So that I can monitor a patient

  Scenario: Start treatment successfully
    Given I am authenticated as a nurse
    When I send a POST request to "/api/treatment-tracking/treatments"
    Then the response status should be 201
    And the response body should contain:
    """
    {
      "message": "Treatment started successfully",
      "totalGeneratedDoses": 5
    }
    """
