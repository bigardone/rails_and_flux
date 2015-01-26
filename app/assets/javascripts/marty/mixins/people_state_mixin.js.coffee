@PeopleStateMixin = Marty.createStateMixin
  listenTo: PeopleStore

  getState: () ->
    people: PeopleStore.findPeople()
    meta: PeopleStore.paginationMeta()

