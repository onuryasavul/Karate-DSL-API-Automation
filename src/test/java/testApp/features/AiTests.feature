Feature: AI Generated Positive and Negative Tests for Conduit App endpoints

  Background:
    Given url Url

  # ---------------------------------------------------------
  # TAGS ENDPOINT (GET /tags)
  # ---------------------------------------------------------

  @Positive @Tags
  Scenario: [Positive] Sistemdeki tüm etiketleri (tags) başarıyla getir
    Given path 'tags'
    When method GET
    Then status 200
    And match response.tags == '#array'
    # Gelen etiket listesinin boş olmadığından emin ol
    And match response.tags[0] == '#notnull'
    And match each response.tags == '#string'

  @Negative @Tags
  Scenario: [Negative] Desteklenmeyen HTTP metodu ile (POST) 'tags' endpointine istek atılması
    Given path 'tags'
    And request { "tag": "yeniEtiket" }
    When method POST
    # API yapısına göre 404 Not Found, 405 Method Not Allowed veya 401 Unauthorized dönebilir.
    # 200 veya 201 (Başarılı) dönmediğini doğrular:
    Then match responseStatus != 200
    And match responseStatus != 201


  # ---------------------------------------------------------
  # ARTICLES ENDPOINT (GET /articles)
  # ---------------------------------------------------------

  @Positive @Articles
  Scenario: [Positive] Geçerli ve sınırlandırılmış sayıda (Limit=5) makale getir
    Given path 'articles'
    And param limit = 5
    When method GET
    Then status 200
    And match response.articles == '#[5]'
    And match response.articlesCount == '#number'

  @Positive @Articles
  Scenario: [Positive] Geçerli bir offset (Sayfalama) parametresi ile makaleleri getir
    Given path 'articles'
    And params { offset: 10 }
    When method GET
    Then status 200
    # Sayfalandırma sonrasında da bir dizi (array) döndüğünü doğrular
    And match response.articles == '#array'
    And match response.articlesCount == '#number'

  @Negative @Articles
  Scenario: [Negative] Geçersiz Limit değeri (String/Harf) ile makale getirmeyi dene
    Given path 'articles'
    And param limit = 'on_bes'
    When method GET
    # İdeal bir API bu durumda 422 Unprocessable Entity veya 400 Bad Request dönmelidir.
    Then match responseStatus == 422

  @Negative @Articles
  Scenario: [Negative] Negatif bir Limit değeri (-5) ile makale getirmeyi dene
    Given path 'articles'
    And param limit = -5
    When method GET
    # Sayı geçerli bir formatta olsa da, -5 makale çekmek mantıksız olduğu için API hata vermelidir.
    Then match responseStatus == 422

  @Negative @Articles @Auth
  Scenario: [Negative] Kimlik doğrulaması (Token) olmadan yeni bir makale oluşturmayı dene
    Given path 'articles'
    And request {"article": {"title": "Yetkisiz Makale", "description": "Test", "body": "Test"}}
    When method POST
    # Token olmadığı için API 401 Unauthorized dönmelidir.
    Then status 401
