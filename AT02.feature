Feature: Mother registers a new patient
  As a mother I want to register my child as a patient so I can track his health

  Background:
    Given the system has a mother "76543210" with password "SecurePass123"
    And I am authenticated as that mother

  Scenario: Mother registers a new patient successfully
    When I POST "/api/patients/register" with body:
      """
      {
        "name": "Mateo",
        "lastName": "Perez",
        "birthDate": "2023-05-10",
        "gender": "MALE",
        "weight": 12.5,
        "height": 85
      }
      """
    Then the response status is 201
    And the JSON at "$.message" = "Patient registered successfully"
    And the JSON at "$.id" exists

  Scenario: Mother tries to register patient with missing data
    When I POST "/api/patients/register" with body:
      """
      {
        "name": "Mateo",
        "gender": "MALE"
      }
      """
    Then the response status is 400
    And the JSON at "$.error" contains "Invalid input"