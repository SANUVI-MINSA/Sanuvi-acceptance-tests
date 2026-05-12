Feature: Mother Registration and Login
  As a mother I want to register and log in to the system so I can manage my children's health

  Background:
    Given the system has no user with DNI "76543210"

  Scenario: Mother registers successfully
    When I POST "/api/users/register/mother" with body:
      """
      {
        "name": "Diana",
        "lastname": "Perez",
        "dni": "76543210",
        "email": "diana@example.com",
        "phone": "955123456",
        "password": "SecurePass123"
      }
      """
    Then the response status is 201
    And the JSON at "$.message" = "Mother registered successfully"

  Scenario: Mother logs in successfully
    Given the system has a mother "76543210" with password "SecurePass123"
    When I POST "/api/users/login" with body:
      """
      { "dni": "76543210", "password": "SecurePass123" }
      """
    Then the response status is 200
    And the JSON at "$.token" exists
    And the JSON at "$.role" = "MOTHER"

  Scenario: Login fails with wrong password
    When I POST "/api/users/login" with body:
      """
      { "dni": "76543210", "password": "wrong" }
      """
    Then the response status is 401
    And the JSON at "$.error" = "Invalid credentials"