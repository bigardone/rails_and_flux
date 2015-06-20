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
    resetSearch: PeopleConstants.RESET_SEARCH

  fetchPeople: () ->
    @fetch
      id: 'all-people'
      locally: () =>
        @state.people
      remotely: () =>
        @app.people.queries.findPeople()

  receivePeople: (response) ->
    @setState
      people: response.people
      meta: response.meta

  updateSearchText: (text) ->
    @setState
      searchText: text

  resetSearch: ->
    @setState
      searchText: ''

