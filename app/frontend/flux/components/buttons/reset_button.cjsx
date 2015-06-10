module.exports = React.createClass
  displayName: 'ResetButton'

  mixins: [
    Marty.createAppMixin()
  ]

  _handleOnClick: (e) ->
    e.preventDefault()
    @app.people.actionCreators.resetSearch()

  render: ->
    <a className={@props.styleClass} href="#" onClick={@_handleOnClick}>{@props.text}</a>
