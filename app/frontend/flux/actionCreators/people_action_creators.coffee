PeopleConstants = require '../constants/people_constants'

module.exports = Marty.createActionCreators
  id: 'PeopleActionCreators'

  setSearchText: (text) ->
    @dispatch PeopleConstants.SET_SEARCH_TEXT, text

  resetSearch: () ->
    @dispatch PeopleConstants.RESET_SEARCH
    @app.people.queries.findPeople 1, ''
