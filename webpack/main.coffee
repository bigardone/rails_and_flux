React = require 'react'
PeopleSection = require './flux/components/people/people_section'

$ ->
  NProgress.configure
    showSpinner: false
    ease: 'ease'
    speed: 500


  React.render React.createElement(PeopleSection, null), document.getElementById('people_list')
