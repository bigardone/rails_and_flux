Marty = require 'marty'
PeopleAPI = require '../sources/people_api'
PeopleConstants = require '../constants/people_constants'

PeopleQueries = Marty.createQueries
  id: 'PeopleQueries'

  findPeople: (pageNumber, searchText)->
    PeopleAPI.findPeople(pageNumber, searchText)
    .then (res) =>
      @dispatch PeopleConstants.RECEIVE_PEOPLE, res.body
    .catch (err) ->
      console.log err

module.exports = PeopleQueries
