PeopleSearch = require './people_search'
PersonCard = require './person_card'
PaginatorSection = require '../paginator/paginator_section'
ResetButton = require '../buttons/reset_button'

PeopleSection = React.createClass
  displayName: 'PeopleSection'

  _paginateResults: (pageNumber)->
    @app.people.queries.findPeople pageNumber, @props.searchText

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
      <ResetButton text="Reset filter" styleClass="btn" />
    </div>

  render: ->
    <div>
      <PeopleSearch totalCount={@props.meta.total_count} value={@props.searchText}/>
      <PaginatorSection totalPages={@props.meta.total_pages} currentPage={@props.meta.current_page} onPaginate={@_paginateResults}/>
      <div className="cards-wrapper">
        {@_renderPeople()}
      </div>
      <PaginatorSection totalPages={@props.meta.total_pages} currentPage={@props.meta.current_page} onPaginate={@_paginateResults}/>
    </div>

module.exports = Marty.createContainer PeopleSection,
  listenTo: 'people.store'
  fetch:
    people: ->
      @app.people.store.fetchPeople()
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
