class ShufflerFavorites.Routers.Users extends Backbone.Router

   routes:
      '': 'index'
      'users/': 'callUsers'
      'shufflerCallback': 'handleShufflerCallback'

   index: ->
      view = new ShufflerFavorites.Views.UsersIndex()
      $('#content').html(view.render().el)

   shufflerCallback: ->
      alert "callback"
      
   callUsers: ->
      alert "showUsers"

