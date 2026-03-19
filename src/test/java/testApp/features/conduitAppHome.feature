Feature: Karate test script on conduit.bondaracademy.com

  Background:
    # GET NEW TOKENS
    * def tokenResponse = callonce read('classpath:helpers/getToken.feature')
    * def token = tokenResponse.authToken
    Given url Url

  @Test1
  Scenario: Get all tags
    Given path 'tags'
    When method GET
    Then status 200
    And match response.tags == '#array'
    And match response.tags contains 'Test'
    And match response.tags contains ['Git', 'Blog']
    And match response.tags !contains 'Test1234'
    And match each response.tags == '#string'
    # And match response.tags == ["Test","Blog","Git","YouTube","Slack","Bondar Academy","GitHub","Zoom","Value-Focused","Start for Free"]

  @Test2 @ignore
  Scenario: Get 1 article
    Given path 'articles'
    And params { limit: 1, offset: 0 }
    # And param offset = 0
    # And param limit = 1
    When method GET
    Then status 200
    And match response.articles[0].author.username == "Artem Bondar"
    And match response.articles[0].createdAt == "2024-01-27T21:52:32.682Z"
    And match response.articles[0].slug == "Discover-Bondar-Academy:-Your-Gateway-to-Efficient-Learning-1"