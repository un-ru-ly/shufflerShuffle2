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
        #shufflerFavouritesData = $.getJSON "https://api.shuffler.fm/v2/users/" + @get('shufflerId')+ "/favorites?app-key=63rm78kb8c&access_token=" + @get('shufflerKey')

        shufflerFavouritesData = [{"created_at": "2013-04-18T14:55:11", "user_id": 90572, "id": 318831, "track_id": 1703073}, {"created_at": "2013-04-18T14:57:41", "user_id": 90572, "id": 318833, "track_id": 1703008}, {"created_at": "2013-04-24T00:44:25", "user_id": 90572, "id": 323798, "track_id": 1719610}, {"created_at": "2013-04-24T01:17:48", "user_id": 90572, "id": 323817, "track_id": 1722575}, {"created_at": "2013-04-24T01:18:20", "user_id": 90572, "id": 323818, "track_id": 1722459}, {"created_at": "2013-04-24T01:18:51", "user_id": 90572, "id": 323820, "track_id": 1719579}]

        #@for key, value of shufflerTrackData
        #  console.log value.track_id

        for key, value of shufflerFavouritesData
          if @tracks.where({'shufflerId' : value.track_id}).length == 0  
            shufflerTrackData = $.getJSON "https://api.shuffler.fm/v2/tracks/" + value.track_id + "?app-key=63rm78kb8c&access_token=" + @get('shufflerKey')
            @tracks.create ({userId: @id, trackId: value.track_id, title: shufflerTrackData.metadata.artist.name + ' ' + shufflerTrackData.metadata.title}) 

    )
