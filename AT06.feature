Feature: Reserve Appointment

  As a mother
  I want to reserve an appointment
  So that my child can receive care

  Scenario: Reserve appointment successfully
    Given an available time slot
    When the reservation is submitted
    Then the appointment is created
