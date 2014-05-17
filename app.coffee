S = require './lib/search'

err = ->

s = new S('music-hack-day')
    
s.artist 'taylor', err, (data) ->
  console.dir data
