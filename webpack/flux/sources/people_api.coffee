Marty = require 'marty'
PeopleSourceActionCreators = require '../actions/source_actions/people_source_action_creators'

PeopleAPI = Marty.createStateSource
  id: 'PeopleAPI'
  type: 'http'

  findPeople: (pageNumber, searchText) ->
    req =
      url: Routes.people_path(
        page: pageNumber
        search: searchText
      )

    @get(req)

module.exports = PeopleAPI
