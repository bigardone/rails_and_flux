PeopleSearch = require './people_search'
PersonCard = require './person_card'
PaginatorSection = require '../paginator/paginator_section'
ResetButton = require '../buttons/reset_button'

PeopleSection = React.createClass
  displayName: 'PeopleSection'

  _retrieveResultsPage: (pageNumber)->
    @app.people.queries.findPeople pageNumber, @props.searchText

  _handleOnSearchSubmit: (searchText) ->
    @app.people.actionCreators.setSearchText searchText
    @app.people.queries.findPeople '', searchText

  _handleOnResetClick: ->
    @app.people.actionCreators.setSearchText ''
    @app.people.queries.findPeople '', ''

  _handleOnSearchChange: (value) ->
    @app.people.actionCreators.setSearchText value

  _renderPeople: ()->
    if @props.people.length is 0 then return @_renderNoResultsFound()

    @props.people.map (person) ->
      <PersonCard key={person.id} {...person}/>

  _renderNoResultsFound:->
    <div className="warning">
      <span className="fa-stack">
        <i className="fa fa-meh-o fa-stack-2x"></i>
      </span>
      <h4>No people found...</h4>
      <ResetButton text="Reset filter" styleClass="btn" onResetClick={@_handleOnResetClick}/>
    </div>

  render: ->
    <div>
      <PeopleSearch totalCount={@props.meta.total_count} onFormSubmit={@_handleOnSearchSubmit} value={@props.searchText}/>
      <PaginatorSection totalPages={@props.meta.total_pages} currentPage={@props.meta.current_page} onPaginate={@_retrieveResultsPage}/>
      <div className="cards-wrapper">
        {@_renderPeople()}
      </div>
      <PaginatorSection totalPages={@props.meta.total_pages} currentPage={@props.meta.current_page} onPaginate={@_retrieveResultsPage}/>
    </div>


module.exports = Marty.createContainer PeopleSection,
  listenTo: 'people.store'
  fetch:
    people: ->
      @app.people.store.findPeople '', ''
    meta: ->
      @app.people.store.getState().meta
    searchText: ->
      @app.people.store.getState().searchText
  pending: ->
    <div className="warning">
      <span className="fa-stack">
        <i className="fa fa-search fa-stack-2x"></i>
      </span>
      <h4>Searching...</h4>
    </div>
  failed: (errors)->
    <div className="warning">
      <span className="fa-stack">
        <i className="fa fa-exclamation-triangle fa-stack-2x"></i>
      </span>
      <h4>{errors}</h4>
    </div>
