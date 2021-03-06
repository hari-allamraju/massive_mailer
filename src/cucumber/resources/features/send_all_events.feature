Feature: Send all events to contacts with the same location as the event - Singapore
  As the admin I want to send all the registered events in a single email to the contacts in the same location
  so that I can gather as many people as possible in the event

  Background:
    Given visit event list page

  @email
  Scenario: Have events but have no events at same location
    When We have below number of contacts at each location:
      |location | number of contacts|
      |Singapore|                  0|
    And We have below number of events at each location:
      |location | number of events  |
      |Singapore|                  3|
    And I click send button
    Then It should not send out emails

  @email
  Scenario: Have contacts but no event at same location
    When We have below number of contacts at each location:
      |location | number of contacts|
      |Singapore|                  2|
    And We have below number of events at each location:
      |location | number of events  |
      |Singapore|                  0|
    And I click send button
    Then It should not send out emails

  @email
  Scenario: Have both event and contacts at single location
    When We have below number of contacts at each location:
    |location | number of contacts|
    |Singapore|                  2|
    And We have below number of events at each location:
    |location | number of events  |
    |Singapore|                  3|
    And I click send button
    Then It should send out emails:
    |location | number of emails  | number of events in the email  |
    |Singapore|                  2|                               6|

  @email
  Scenario: Contacts from multiple location not within radius, Events at single location
    When We have below number of contacts at each location:
      |location | number of contacts|
      |Singapore|                  2|
      |Tokyo    |                  5|
    And We have below number of events at each location:
      |location | number of events  |
      |Singapore|                  3|
    And I click send button
    Then It should send out emails:
      |location | number of emails  | number of events in the email |
      |Combined |                  2|                              6|

  @email @developing
  Scenario: Contacts from single location, events at multiple location with some within radius
    When We have below number of contacts at each location:
      |location | number of contacts|
      |Singapore|                  2|
    And We have below number of events at each location:
      |location | number of events  |
      |Singapore|                  3|
      |Tokyo    |                  7|
      |Bangkok  |                  1|
    And I click send button
    Then It should send out emails:
      |location | number of emails  | number of events in the email |
      |Combined |                  2|                              8|

  @email @developing
  Scenario: Have both event and contacts at multiple location
    When We have below number of contacts at each location:
      |location | number of contacts|
      |Singapore|                  2|
      |Tokyo    |                  5|
    And We have below number of events at each location:
      |location | number of events  |
      |Singapore|                  3|
      |Tokyo    |                  7|
      |Bangkok  |                  1|
    And I click send button
    Then It should send out emails:
      |location | number of emails  | number of events in the email  |
      |Combined |                  7|                              43|

  @email @developing
  Scenario: Contacts from multiple locations, events at single location with some within radius
    When We have below number of contacts at each location:
      |location | number of contacts|
      |Singapore|                  2|
      |Tokyo    |                  5|
      |Bangkok  |                  3|
    And We have below number of events at each location:
      |location | number of events  |
      |Singapore|                  3|
    And I click send button
    Then It should send out emails:
      |location | number of emails  | number of events in the email  |
      |Combined |                  5|                              15|

  @email
  Scenario: Contacts from multiple locations, events at single location not within radius
    When We have below number of contacts at each location:
      |location | number of contacts|
      |Singapore|                  2|
      |Bangkok  |                  3|
    And We have below number of events at each location:
      |location | number of events  |
      |Tokyo    |                  3|
    And I click send button
    Then It should not send out emails
