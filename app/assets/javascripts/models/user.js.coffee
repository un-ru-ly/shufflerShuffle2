class ShufflerFavorites.Models.User extends Backbone.Model

  urlRoot: '/users/'

  getTracksFromShuffler: ->
    console.log 'x'
    @tracks = new ShufflerFavorites.Collections.Tracks
    @tracks.url = '/users/' + this.id + '/tracks'
    @tracks.fetch (
      success: =>
        console.log('Fetched track information')

        # Get new tracks from shuffler
        shufflerTrackData = $.getJSON "https://api.shuffler.fm/v2/users/" + @get('shufflerId')+ "/favorites?app-key=63rm78kb8c&access_token=" + @get('shufflerKey')

        for key, value of shufflerTrackData
          @tracks.create ({userId: @id, trackId: value}) if not @tracks.where

    )
