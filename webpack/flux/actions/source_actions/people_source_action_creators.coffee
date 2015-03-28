Marty = require 'marty'
PeopleConstants = require '../../constants/people_constants'

PeopleSourceActionCreators = Marty.createActionCreators
  id: 'PeopleSourceActionCreators'
  receivePeople: (people)->
    @dispatch PeopleConstants.RECEIVE_PEOPLE, people

module.exports = PeopleSourceActionCreators
