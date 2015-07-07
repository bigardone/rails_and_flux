module.exports = Marty.createApplication () ->
  @register
    people:
      store: require '../stores/people_store'
      queries: require '../queries/people_queries'
      actionCreators: require '../actionCreators/people_action_creators'
      sources: require '../sources/people_api'
  @router = require '../../router'
