Feature:

Background:
    # GET NEW TOKENS
    * def tokenResponse = callonce read('classpath:helpers/getToken.feature')
    * def token = tokenResponse.authToken
    Given url Url

Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"title": "Bla Bla", "description": "test", "body": "test body"}}
    When method POST
    Then status 200
    And match response.article.title == 'Bla Bla'
