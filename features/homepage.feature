Feature: homepage

  Scenario:
    Given a homepage article "Funk is het toverwoord"
    When I visit the homepage
    Then I see "Funk is het toverwoord"
