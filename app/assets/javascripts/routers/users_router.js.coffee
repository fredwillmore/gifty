class Gifty.Routers.Users extends Backbone.Router
   routes:
      '': 'index'
      'users/:id/add_friend': 'add_friend'

   index: ->
#      alert "hello home page"

   show: (id) ->
#      alert "hello #{id}"

   add_friend: (id) ->
      view = new Gifty.Views.Users
