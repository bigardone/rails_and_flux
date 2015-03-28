Marty = require 'marty'
PeopleAPI = require '../sources/people_api'
PeopleConstants = require '../constants/people_constants'

PeopleQueries = Marty.createQueries
  id: 'PeopleQueries'

  findPeople: (pageNumber, searchText)->
    debugger
    PeopleAPI.findPeople(pageNumber, searchText)
    .then (res) ->
      console.log res
    .catch (err) ->
      console.log 'err'

module.exports = PeopleQueries
