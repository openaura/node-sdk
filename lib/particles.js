// Generated by CoffeeScript 1.6.3
(function() {
  var Particles, Search, async, rest, util;

  rest = require('restler');

  async = require('async');

  util = require('./prop');

  Search = require('./search');

  Particles = (function() {
    function Particles(apiKey, baseUrl, defaultLimit) {
      this.apiKey = apiKey;
      this.baseUrl = baseUrl != null ? baseUrl : "http://api.openaura.com/v1";
      this.defaultLimit = defaultLimit != null ? defaultLimit : 50;
    }

    Particles.prototype.byOaArtistId = function(id, err, cb) {
      var uri;
      uri = "" + this.baseUrl + "/particles/artists/" + id + "?api_key=" + this.apiKey + "&id_type=oa:artist_id";
      console.log("req to: " + uri);
      return this._get(uri, err, cb);
    };

    Particles.prototype.byOaAnchorId = function(id, err, cb) {
      var uri;
      uri = "" + this.baseUrl + "/particles/artists/" + id + "?api_key=" + this.apiKey + "&id_type=oa:anchor_id";
      console.log("req to: " + uri);
      return this._get(uri, err, cb);
    };

    Particles.prototype.byMusicbrainzGid = function(id, err, cb) {
      var uri;
      uri = "" + this.baseUrl + "/particles/artists/" + id + "?api_key=" + this.apiKey + "&id_type=musicbrainz:gid";
      console.log("req to: " + uri);
      return this._get(uri, err, cb);
    };

    Particles.prototype._get = function(uri, err, cb) {
      var call;
      call = rest.get(uri);
      call.on('success', function(data, res) {
        console.log('success');
        return cb(data);
      });
      call.on('fail', function(data, res) {
        console.log('fail', res.statusCode);
        return err(data);
      });
      return call.on('complete', function(data, res) {
        return console.log('complete');
      });
    };

    return Particles;

  })();

  module.exports = Particles;

}).call(this);
