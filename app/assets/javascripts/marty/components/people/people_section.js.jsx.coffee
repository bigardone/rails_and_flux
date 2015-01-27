@PeopleSection = React.createClass
  displayName: 'PeopleSection'

  mixins: [PeopleStateMixin]

  _retrieveResultsPage: (pageNumber)->
    PeopleSourceActionCreators.findPeople pageNumber, @state.textToFetch

  _handleOnSearchSubmit: (searchText) ->
    @state.textToFetch = searchText
    PeopleSourceActionCreators.findPeople '', searchText

  _handleOnResetClick: ->
    @state.textToFetch = ''
    PeopleSourceActionCreators.findPeople '', ''

  _renderPending: ()->
    `<div className="warning">
      <span className="fa-stack">
        <i className="fa fa-search fa-stack-2x"></i>
      </span>
      <h4>Searching...</h4>
    </div>`

  _renderError: (error)->
    `<div className="warning">
      <span className="fa-stack">
        <i className="fa fa-exclamation-triangle fa-stack-2x"></i>
      </span>
      <h4>{error}</h4>
    </div>`

  _renderPeople: (people)->
    if people.length > 0
      people.map (person) ->
        `<PersonCard key={person.id} {...person}/>`
    else
      `<div className="warning">
        <span className="fa-stack">
          <i className="fa fa-meh-o fa-stack-2x"></i>
        </span>
        <h4>No people found...</h4>
        <ResetButton text="Reset filter" styleClass="btn" onResetClick={this._handleOnResetClick}/>
      </div>`

  render: ->
    responseNodes = @state.people.when
      pending: @_renderPending
      failed: @_renderError
      done: @_renderPeople

    `<div>
      <PeopleSearch totalCount={this.state.meta.total_count} onFormSubmit={this._handleOnSearchSubmit} value={this.state.textToFetch}/>
      <PaginatorSection totalPages={this.state.meta.total_pages} currentPage={this.state.meta.current_page} onPaginate={this._retrieveResultsPage}/>
      <div className="cards-wrapper">
        {responseNodes}
      </div>
      <PaginatorSection totalPages={this.state.meta.total_pages} currentPage={this.state.meta.current_page} onPaginate={this._retrieveResultsPage}/>
    </div>`
