Feature: Tags Endpoint Performance Test

  Background:
    # URL comes from karate-config.js (Url)
    Given url Url

  Scenario: Get Tags Performance
    Given path 'tags'
    When method GET
    Then status 200
    And match response.tags == '#array'
