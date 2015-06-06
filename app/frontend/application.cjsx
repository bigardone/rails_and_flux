Marty.HttpStateSource.removeHook('parseJSON')
PeopleSection = require './flux/components/people/people_section'
ApplicationContainer = Marty.ApplicationContainer

$ ->
  MainApplication = Marty.createApplication () ->
    @register
      people:
        store: require './flux/stores/people_store'
        queries: require './flux/queries/people_queries'
        actionCreators: require './flux/actionCreators/people_action_creators'
        sources: require './flux/sources/people_api'


  appContainer = <ApplicationContainer app={new MainApplication()}><PeopleSection/></ApplicationContainer>


  React.render appContainer, document.getElementById('people_list')
