class Gifty.Views.Users extends Backbone.View

  template: JST['users/friend']

  render: ->
    $(@el).html(@template())
    this

#    hello000