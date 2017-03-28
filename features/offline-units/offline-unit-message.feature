Feature: Offline Unit Message
  As a user,
  I want to know when a shelter goes offline
  So that I can see that capacity is reduced and I can make alternative arrangements to shelter clients

  #
  # Assumptions:
  # We assume that all units go offline for cleaning at between 8am-2pm and return online at 2pm-6pm
  # in time to be used by clients for the evening.
  #
  # FWC shelters call DHS people around 5pm and let them know which units are still offline.
  # They provide a list of specific unit numbers and the approximate timeframes for when they
  # will return to service.
  # The DHS people also inquire about units that were offline from the previous day or earlier,
  # in case any of them have returned to service.
  # In that way every day at 6pm we get an updated list of offline units.
  # CARES does not record the specific reasons why a unit is offline; that information will be in
  # Capdash only.
  #
  # Adult shelters update CARES directly.  Adult shelters are responsible for updating CARES by 6pm
  # to indicate how many units are still offline.
  # Unlike FWC, for adult shelters CARES does not include specific unit numbers that are offline,
  # we only know gross numbers.  That is because for adults many units are often lumped in a single
  # large room, and each bed does not have a unique serial number we just know the overall count.
  #
  # We assume there exists a micro-service that connects to CARES that can send us asynchronous messages
  # The asynchronous messages include updates about one or more shelters as their units or overall
  # capacity is updated.
  #

  @ignore
  Scenario: Multiple units went offline

  @ignore
  Scenario: Multiple units went offline and some previously offline units came back online

  @ignore
  Scenario: Multiple units came back online, including some units we didn't know were offline
