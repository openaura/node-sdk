rest  = require 'restler'
async = require 'async'
util  = require './prop'
Search = require './search'

class Particles
  constructor:  (@apiKey, @baseUrl = "http://api.openaura.com/v1", @defaultLimit = 50) ->

  byOaArtistId: (id, err, cb) ->
    uri = "#{@baseUrl}/particles/artists/#{id}?api_key=#{@apiKey}&id_type=oa:artist_id"
    console.log "req to: #{uri}"
    @_get(uri, err, cb)

  byOaAnchorId: (id, err, cb) ->
    uri = "#{@baseUrl}/particles/artists/#{id}?api_key=#{@apiKey}&id_type=oa:anchor_id"
    console.log "req to: #{uri}"
    @_get(uri, err, cb)

  byMusicbrainzGid: (id, err, cb) ->
    uri = "#{@baseUrl}/particles/artists/#{id}?api_key=#{@apiKey}&id_type=musicbrainz:gid"
    console.log "req to: #{uri}"
    @_get(uri, err, cb)  
    
  _get: (uri, err, cb) ->
    call = rest.get uri
    call.on 'success', (data, res) ->
      console.log 'success'
      cb(data)

    call.on 'fail', (data, res) ->
      console.log 'fail', res.statusCode
      err(data)

    call.on 'complete', (data, res) ->
      console.log 'complete'
 
    
module.exports = Particles
