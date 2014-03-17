window.Gifty =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Gifty.Routers.Users()
    Backbone.history.start()

$(document).ready ->
  Gifty.initialize()
