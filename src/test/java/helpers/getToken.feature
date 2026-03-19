Feature: Get token for tests

Scenario: Get token
    * def payload = {}
    * set payload.user.email = "karate@test"
    * set payload.user.password = "karate123"

    Given url Url
    And path 'users/login'
    And request payload
    When method POST
    Then status 200
    
    * def authToken = response.user.token
