Feature: Register food in nutritional diary
  As a mother I want to register what my child ate today so that the nurse can monitor nutrition

  Background:
    Given the system has a mother "76543210" with password "SecurePass123"
    And the mother has a patient with id "patient-123"
    And the system has a food item "Manzana" with id "food-456"
    And I am authenticated as that mother

  Scenario: Mother registers a food entry successfully
    When I POST "/api/nutritional-diary/food-entry" with body:
      """
      {
        "patientId": "patient-123",
        "foodItemId": "food-456",
        "quantity": 1.5
      }
      """
    Then the response status is 201
    And the JSON at "$.message" = "Food registered successfully"

  Scenario: Mother tries to register without required fields
    When I POST "/api/nutritional-diary/food-entry" with body:
      """
      {
        "patientId": "patient-123"
      }
      """
    Then the response status is 400