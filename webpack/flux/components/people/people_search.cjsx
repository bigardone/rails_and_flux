React = require 'react'
ResetButton = require '../buttons/reset_button'

PeopleSearch = React.createClass
  displayName: 'PeopleSearch'

  getInitialState: ->
    searchLength: 0

  componentDidMount: ->
    @_subscribeToEvents()

  componentWillReceiveProps: (nextProps) ->
    @setState
      value: nextProps.value
      searchLength: if nextProps.value? then nextProps.value.length else 0

  _subscribeToEvents: ->
    $(@refs.search.getDOMNode()).on 'keyup', @_handleSearchOnKeyup

  _handleOnSubmit: (e) ->
    e.preventDefault()

    searchValue = @state.value
    @props.onFormSubmit(searchValue)

  _handleSearchOnKeyup: (e) ->
    @setState
      searchLength: $(e.target).val().length

  _personText: (count) ->
    if count > 1 then 'people' else 'person'

  _handleOnResetClick: ->
    @refs.search.getDOMNode().value = ''
    @props.onFormSubmit('')
    @setState
      searchLength: 0

  _renderResetButton: ->
    return false unless @state.searchLength != 0

    <ResetButton text="Reset filter" styleClass="reset"  onResetClick={this._handleOnResetClick}/>

  _onChange: ->
    @setState
      value: @refs.search.getDOMNode().value.trim()

  render: ->
    count = @props.totalCount
    personText = @_personText(count)
    overviewTitle = if @props.totalCount > 0 then "#{count} #{personText} found"

    <div className="filter-wrapper">
      <div className="overview-wrapper">
        <h3>{overviewTitle}</h3>
        &nbsp;
      </div>
      <div className="form-wrapper">
        <form onSubmit={this._handleOnSubmit}>
          {this._renderResetButton()}
          <input ref="search" placeholder="Search people..." type="search" value={this.state.value} onChange={this._onChange}/>
        </form>
      </div>
    </div>

module.exports = PeopleSearch
