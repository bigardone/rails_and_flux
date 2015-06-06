module.exports = React.createClass
  displayName: 'PaginatorLink'
  mixins: [React.addons.PureRenderMixin]

  _handleOnClick: (e) ->
    e.preventDefault()
    @props.onPaginatorLinkClick(@props.pageNumber)

  render: ->
    <a href="#" onClick={this._handleOnClick}>&nbsp;</a>

