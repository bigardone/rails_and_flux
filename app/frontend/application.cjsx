window.Marty = Marty
Marty.HttpStateSource.removeHook('parseJSON')
PeopleSection = require './flux/components/people/people_section'
ApplicationContainer = Marty.ApplicationContainer
MainApplication = require './flux/applications/main_application'

$ ->
  mainApplication = new MainApplication()

  mainApplication.router.run (Handler, state) ->
    appContainer = <ApplicationContainer app={mainApplication}>
      <Handler {...state.params}/>
    </ApplicationContainer>

    React.render appContainer, document.getElementById('people_list')
