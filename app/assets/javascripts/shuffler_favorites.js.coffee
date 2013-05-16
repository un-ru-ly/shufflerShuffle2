window.ShufflerFavorites =
   Models: {}
   Collections: {}
   Views: {}
   Routers: {}
   initialize: -> 
      new ShufflerFavorites.Routers.Users()
      console.log Backbone.history.start({pushState: true})


$(document).ready ->
   ShufflerFavorites.initialize()
