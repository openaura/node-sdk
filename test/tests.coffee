assert    = require 'assert'
Search    = require '../lib/search'
Info      = require '../lib/info'
Particles = require '../lib/particles'
util      = require '../lib/prop'

err = (data, res) ->
  console.log 'ERROR'
  console.dir data
  console.dir res

describe 'prop', ->
  it 'should pull properties out of nested objects', ->
    o =
      foo:
        bar: "bar"
        baz: "baz"
    assert util.prop(o, "foo.bar") == "bar"
    assert util.prop(o, "blaz") == null

describe 'Search', ->
  it 'should return something for "taylor"', (done) ->
    s = new Search('music-hack-day')
    s.artist 'taylor', err, (data) ->
      assert(data.length > 0)
      done()

describe 'Info', ->
  it 'should return something for oa:artist_id = 47', (done) ->
    i = new Info('music-hack-day')
    i.byOaArtistId 47, err, (data) ->
      assert data
      done()
      
  it 'should return something for oa:anchor_id = 528fde50e4b084ba1571c831', (done) ->
    i = new Info('music-hack-day')
    i.byOaAnchorId "528fde50e4b084ba1571c831", err, (data) ->
      assert data
      done()

  it 'should return something for musicbrainz:gid = "20244d07-534f-4eff-b4d4-930878889970"', (done) ->
    i = new Info('music-hack-day')
    i.byMusicbrainzGid "20244d07-534f-4eff-b4d4-930878889970", err, (data) ->
      assert data
      done()

  it 'should return something for iFeelLucky query with "taylor"', (done) ->
    i = new Info('music-hack-day')
    i.iFeelLucky "taylor", err, (data) ->
      assert data
      done()

describe 'Particles', ->
  it 'should return something for oa:artist_id = 47', (done) ->
    p = new Particles('music-hack-day')
    p.byOaArtistId 47, err, (data) ->
      assert data
      done()

  it 'should return something for oa:anchor_id = 528fde50e4b084ba1571c831', (done) ->
    p = new Particles('music-hack-day')
    p.byOaAnchorId "528fde50e4b084ba1571c831", err, (data) ->
      assert data
      done()

  it 'should return something for musicbrainz:gid = "20244d07-534f-4eff-b4d4-930878889970"', (done) ->
    p = new Particles('music-hack-day')
    p.byMusicbrainzGid "20244d07-534f-4eff-b4d4-930878889970", err, (data) ->
      assert data
      done()
