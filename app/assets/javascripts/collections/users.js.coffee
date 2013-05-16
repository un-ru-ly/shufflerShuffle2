class ShufflerFavorites.Collections.Users extends Backbone.Collection

  model: ShufflerFavorites.Models.User
  url: '/users/'
  
  initialize: ->
      console.log 'xyz'
