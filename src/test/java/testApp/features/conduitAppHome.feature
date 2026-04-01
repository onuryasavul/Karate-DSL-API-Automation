Feature: Karate test script on conduit.bondaracademy.com

  Background:
    # GET NEW TOKENS
    # * def tokenResponse = callonce read('classpath:helpers/getToken.feature')
    # * def token = tokenResponse.authToken
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

  @Test3
  Scenario: Get 2 articles
    Given path 'articles'
    And params { limit: 2, offset: 0 }
    When method GET
    Then status 200
    # Dönen makale sayısının tam olarak 2 olduğunu doğrular
    And match response.articles == '#[2]'
    # Toplam makale sayısı alanının sayısal bir değer olduğunu doğrular
    And match response.articlesCount == '#number'
    # Her bir makalenin başlık ve yazar bilgilerinin string olduğunu doğrular
    And match each response.articles contains { title: '#string' }
    And match each response.articles[*].author contains { username: '#string' }
