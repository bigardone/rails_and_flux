PeopleConstants = require '../constants/people_constants'

module.exports = Marty.createActionCreators
  id: 'PeopleActionCreators'

  findPeople: (pageNumber, searchText)->
    @app.people.sources.findPeople(pageNumber, searchText)

  setSearchText: (text) ->
    @dispatch PeopleConstants.SET_SEARCH_TEXT, text
