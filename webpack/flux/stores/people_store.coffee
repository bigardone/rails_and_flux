Marty = require 'marty'
PeopleConstants = require '../constants/people_constants'
PeopleQueries = require '../queries/people_queries'

PeopleStore = Marty.createStore
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
      locally: () ->
        @state.people
      remotely: () ->
        PeopleQueries.findPeople(pageNumber, searchText)

  paginationMeta: ->
    @state.meta

  receivePeople: (response) ->
    @setState
      people: response.people
      meta: response.meta

  updateSearchText: (text) ->
    @setState
      searchText: text


module.exports = PeopleStore

