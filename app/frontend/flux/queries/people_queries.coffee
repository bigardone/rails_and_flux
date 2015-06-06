PeopleConstants = require '../constants/people_constants'

PeopleQueries = Marty.createQueries
  id: 'PeopleQueries'

  findPeople: (pageNumber, searchText)->
    @app.people.sources.findPeople(pageNumber, searchText)
    .then (res) =>
      @dispatch PeopleConstants.RECEIVE_PEOPLE, res
    .catch (err) ->
      console.log err

module.exports = PeopleQueries
