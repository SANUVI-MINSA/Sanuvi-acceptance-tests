Feature: Search Nearby Health Facilities

  As a mother
  I want to search nearby health facilities
  So that I can schedule appointments

  Scenario: Search nearby facilities
    Given my current coordinates
    When I request nearby facilities
    Then facilities are returned ordered by distance
