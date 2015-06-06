module.exports = React.createClass
  displayName: 'ResetButton'

  _handleOnClick: (e) ->
    e.preventDefault()
    @props.onResetClick()

  render: ->
    <a className={this.props.styleClass} href="#" onClick={this._handleOnClick}>{this.props.text}</a>
