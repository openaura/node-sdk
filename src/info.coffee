rest  = require 'restler'
async = require 'async'
util  = require './prop'
Search = require './search'

class Info
  constructor: (@apiKey, @baseUrl = "http://api.openaura.com/v1") ->

  byOaArtistId: (id, err, cb) ->
    uri = "#{@baseUrl}/info/artists/#{id}?api_key=#{@apiKey}&id_type=oa:artist_id"
    console.log "req to: #{uri}"
    @_get(uri, err, cb)

  byOaAnchorId: (id, err, cb) ->
    uri = "#{@baseUrl}/info/artists/#{id}?api_key=#{@apiKey}&id_type=oa:anchor_id"
    console.log "req to: #{uri}"
    @_get(uri, err, cb)

  byMusicbrainzGid: (id, err, cb) ->
    uri = "#{@baseUrl}/info/artists/#{id}?api_key=#{@apiKey}&id_type=musicbrainz:gid"
    console.log "req to: #{uri}"
    @_get(uri, err, cb)

  iFeelLucky: (str, err, cb) ->
    s = new Search(@apiKey, @baseUrl, 1)
    s.artist str, err, (results) =>
      if results.length > 0
        @byOaArtistId util.prop(results, "0.oa_artist_id"), err, cb

  _get: (uri, err, cb) ->
    call = rest.get uri
    call.on 'success', (data, res) ->
      console.log 'success'
      cb(new ArtistInfo(data))

    call.on 'fail', (data, res) ->
      console.log 'fail', res.statusCode
      err(data)

    call.on 'complete', (data, res) ->
      console.log 'complete'


class ArtistInfo
  constructor: (obj) ->
    prop = util.prop
    clone = util.clone
    
    @oaArtistId = prop obj, "oa_artist_d"
    @oaAnchorId = prop obj, "oa_anchor_id"
    @musicbrainzGid = prop obj, "musicbrainz_gid"
    @name = prop obj, "name"
    @officialAura = prop obj, "official"
    @factCard = clone(prop obj, "fact_card.media.0.data")
    @styleTags = clone(prop obj, "style_tags.media.0.data.tags")
    @bio = prop obj, "bio.media.0.data.text"
    @coverPhoto = for cp in prop obj, "cover_photo"
      do ->
        o = 
          source: clone(prop cp, "source")
          date: prop cp, "date"
          media: clone(prop cp, "media")
          popularity: prop cp, "popularity"
    
    @profilePhoto =
      source: clone(prop obj, "profile_photo.source")
      date: prop obj, "profile_photo.date"
      media: clone(prop obj, "profile_photo.media")
      popularity: prop obj, "profile_photo.popularity"

    for cp in prop obj, "cover_photo"
      do ->
        o = 
          source: clone(prop cp, "source")
          date: prop cp, "date"
          media: clone(prop cp, "media")
          popularity: prop cp, "popularity"

module.exports = Info
