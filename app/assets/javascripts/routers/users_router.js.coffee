class ShufflerFavorites.Routers.Users extends Backbone.Router

  routes:
    '': 'index'
    'users/': 'callUsers'
    'users/:id/tracks/': 'getUserTracks'

  index: ->
    @collection = new ShufflerFavorites.Collections.Users();
    @collection.fetch()
    
    view = new ShufflerFavorites.Views.UsersIndex(collection: @collection)
    $('#content').html(view.render().el)

  getUserTracks: (id) ->
    User = new ShufflerFavorites.Models.User({id: id});
    User.fetch(
      success: ->
        console.log('Fetched user information')
        User.getTracksFromShuffler()
    )
    
