React = require 'react'
Marty = require 'marty'
PeopleStateMixin = require '../../mixins/people_state_mixin'
PeopleSearch = require './people_search'
PersonCard = require './person_card'
PaginatorSection = require '../paginator/paginator_section'
PeopleQueries = require '../../queries/people_queries'
PeopleStore = require '../../stores/people_store'
ResetButton = require '../buttons/reset_button'
PeopleActionCreators = require '../../actions/people_action_creators'


PeopleSection = React.createClass
  displayName: 'PeopleSection'

  _retrieveResultsPage: (pageNumber)->
    PeopleQueries.findPeople pageNumber, @props.searchText

  _handleOnSearchSubmit: (searchText) ->
    PeopleActionCreators.setSearchText searchText
    PeopleQueries.findPeople '', searchText

  _handleOnResetClick: ->
    PeopleQueries.findPeople '', ''

  _handleOnSearchChange: (value) ->
    PeopleActionCreators.setSearchText value

  _renderPeople: ()->
    if @props.people.length > 0
      @props.people.map (person) ->
        <PersonCard key={person.id} {...person}/>
    else
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
  listenTo: PeopleStore
  fetch:
    people: ->
      PeopleStore.findPeople '', ''
    meta: ->
      PeopleStore.paginationMeta()
    searchText: ->
      PeopleStore.state.searchText
  pending: ->
    @done
      people: []
      meta:
          total_count: 0
          total_pages: 0
  failed: (errors)->
    console.log errors
