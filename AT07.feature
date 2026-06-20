Feature: Cancel Appointment

  As a mother
  I want to cancel an appointment
  So that I can reschedule later

  Scenario: Cancel appointment successfully
    Given an existing appointment
    When cancellation is requested
    Then appointment status becomes Cancelled
