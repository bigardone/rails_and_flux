PeopleConstants = require '../constants/people_constants'

module.exports = Marty.createQueries
  id: 'PeopleQueries'

  findPeople: (pageNumber, searchText)->
    @app.people.sources.findPeople(pageNumber, searchText)
    .then (res) =>
      @dispatch PeopleConstants.RECEIVE_PEOPLE, res
    .catch (err) ->
      console.log err

  findPerson: (id)->
    @app.people.sources.findPerson(id)
    .then (res) =>
      @dispatch PeopleConstants.RECEIVE_CURRENT_PERSON, res
    .catch (err) ->
      console.log err
