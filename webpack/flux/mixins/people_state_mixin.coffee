Marty = require 'marty'
PeopleStore = require '../stores/people_store'

PeopleStateMixin = Marty.createStateMixin
  listenTo: PeopleStore

  getState: () ->
    people: PeopleStore.findPeople()
    meta: PeopleStore.paginationMeta()

module.exports = PeopleStateMixin
