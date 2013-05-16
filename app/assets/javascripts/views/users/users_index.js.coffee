class ShufflerFavorites.Views.UsersIndex extends Backbone.View

  template: JST['users/index']
  
  initialize: ->
    @collection.on("reset", @getTracks, this)
  
  render: ->
    $(@el).html(@template)
    this
      
  getTracks: ->
    alert "ja"
