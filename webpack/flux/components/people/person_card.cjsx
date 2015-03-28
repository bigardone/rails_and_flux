React = require 'react'

PersonCard = React.createClass
  displayName: 'PersonCard'

  _birthDate: ->
    moment(@props.birth_date).format('D MMM YYYY')

  render: ->
    cx = React.addons.classSet
    cardClasses = cx
      'card': true
      'female': @props.gender == 'female'
      'male': @props.gender == 'male'

    <div className={cardClasses}>
      <header>
        <div className="avatar-wrapper">
          &nbsp;
          <img className="avatar" src={this.props.picture} />
        </div>
        <div className="info-wrapper">
          <h4>{this.props.first_name} {this.props.last_name}</h4>
          <ul className="meta">
            <li><i className="fa fa-map-marker"></i> {this.props.location}</li>
            <li><i className="fa fa-birthday-cake"></i> {this._birthDate()}</li>
          </ul>
        </div>
      </header>
      <div className="card-body">
        <div className="headline">
          <p>{this.props.headline}</p>
        </div>
        <ul className="contact-info">
          <li><i className="fa fa-phone"></i> {this.props.phone_number}</li>
          <li><i className="fa fa-envelope"></i> {this.props.email}</li>
        </ul>
      </div>
    </div>

module.exports = PersonCard
