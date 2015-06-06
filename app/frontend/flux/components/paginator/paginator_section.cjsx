PaginatorLink = require './paginator_link'

PaginatorSection = React.createClass
  displayName: 'PaginatorSection'

  _handleOnClick: (pageNumber) ->
    @props.onPaginate(pageNumber)

  _renderLinks: ->
    for i in [1..@props.totalPages]
      if i == @props.currentPage
        <li key={i}><span>&nbsp;</span></li>
      else
        <li key={i}><PaginatorLink pageNumber={i} onPaginatorLinkClick={this._handleOnClick} /></li>

  render: ->
    if @props.totalPages > 1
      <ul className="pagination">
        {this._renderLinks()}
      </ul>
    else
      <div>&nbsp;</div>

module.exports = PaginatorSection
