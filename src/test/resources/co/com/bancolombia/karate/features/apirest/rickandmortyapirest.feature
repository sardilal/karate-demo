Feature: Rick and Morty Api Rest

  Background: Set urlBase
    * url urlBase
    * def tatooineplanet = read('../schemas/TatooinePlanet.json')
    * def planetSchema = read('../schemas/PlanetSchema.json')

  @API
  Scenario: GET Characters
    Given path '/people'
    When method GET
    Then status 200
    * match each $.results[*].name == '#string'

  Scenario: GET planets
    Given path '/planets'
    When method GET
    Then status 200
    * match $ == {count: "#number", next: "https://swapi.dev/api/planets/?page=2", previous: "#null", results: "#array"}
    * match each $.results[*] == planetSchema

  Scenario: GET Tatooine Planet
    Given path '/planets/1'
    When method GET
    Then status 200
    * match response == tatooineplanet