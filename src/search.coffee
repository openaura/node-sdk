
rest  = require 'restler'
async = require 'async'

class Search
  constructor: (@apiKey, @baseUrl = "http://api.openaura.com/v1", @defaultLimit = 5) ->

  artist: (str, err, cb) ->
    uri = "#{@baseUrl}/search/artists?api_key=#{@apiKey}&q=#{str}&limit=#{@defaultLimit}"
    console.log "req to: #{uri}"
    call = rest.get uri
    call.on 'success', (data, res) ->
      console.log 'success'
      cb(data)

    call.on 'fail', (data, res) ->
      console.log 'fail', res.statusCode
      err(data)

    call.on 'complete', (data, res) ->
      console.log 'complete'

module.exports = Search
