Marty = require 'marty'
PeopleConstants = require '../constants/people_constants'
PeopleAPI = require '../sources/people_api'

PeopleActionCreators = Marty.createActionCreators
  id: 'PeopleActionCreators'
  findPeople: (pageNumber, searchText)->
    PeopleAPI.findPeople(pageNumber, searchText)

module.exports = PeopleActionCreators
