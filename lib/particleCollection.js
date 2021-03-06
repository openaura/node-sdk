// Generated by CoffeeScript 1.6.3
(function() {
  var ParticleCollection, util;

  util = require("./prop");

  ParticleCollection = (function() {
    function ParticleCollection(ps) {
      this._data = util.clone(ps);
    }

    ParticleCollection.prototype.map = function(fn) {
      var p, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = ps.length; _i < _len; _i++) {
        p = ps[_i];
        _results.push(fn(p));
      }
      return _results;
    };

    ParticleCollection.prototype.select = function(fn) {
      var p, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = ps.length; _i < _len; _i++) {
        p = ps[_i];
        if (fn(p)) {
          _results.push(p);
        }
      }
      return _results;
    };

    return ParticleCollection;

  })();

  module.exports = ParticleCollection;

}).call(this);
