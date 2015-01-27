#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require react
#= require marty
#= require moment
#= require js-routes
#= require nprogress
#= require pubsub

#= require_tree ./utils
#= require_tree ./marty/constants
#= require_tree ./marty/stores
#= require_tree ./marty/sources
#= require_tree ./marty/mixins
#= require_tree ./marty/actions
#= require_tree ./marty/components

$ ->
  NProgress.configure
    showSpinner: false
    ease: 'ease'
    speed: 500

  React.render React.createElement(PeopleSection, null), document.getElementById('people_list')
