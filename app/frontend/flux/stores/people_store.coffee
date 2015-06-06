PeopleConstants = require '../constants/people_constants'

module.exports = Marty.createStore
  id: 'PeopleStore'
  displayName: 'PeopleStore'

  getInitialState: ->
    searchText: ''
    meta:
      total_pages: 0
      current_page: 0

  handlers:
    receivePeople: PeopleConstants.RECEIVE_PEOPLE
    updateSearchText: PeopleConstants.SET_SEARCH_TEXT

  findPeople: (pageNumber, searchText) ->
    @fetch
      id: 'all-people'
      locally: () =>
        @state.people
      remotely: () =>
        @app.people.queries.findPeople(pageNumber, searchText)

  receivePeople: (response) ->
    @setState
      people: response.people
      meta: response.meta

  updateSearchText: (text) ->
    @setState
      searchText: text

