// Generated by CoffeeScript 1.6.3
(function() {
  var clone, prop, util;

  prop = function(obj, propName) {
    var head, propAr, tailStr;
    propAr = propName.split(".");
    head = propAr.shift();
    tailStr = propAr.join(".");
    if (typeof obj !== 'undefined' && obj !== null && obj.hasOwnProperty(head) && typeof obj[head] !== 'undefined' && obj[head] !== null) {
      if (propAr.length) {
        return prop(obj[head], tailStr);
      } else {
        return obj[head];
      }
    } else {
      return null;
    }
  };

  clone = function(obj) {
    var flags, key, newInstance;
    if ((obj == null) || typeof obj !== 'object') {
      return obj;
    }
    if (obj instanceof Date) {
      return new Date(obj.getTime());
    }
    if (obj instanceof RegExp) {
      flags = '';
      if (obj.global != null) {
        flags += 'g';
      }
      if (obj.ignoreCase != null) {
        flags += 'i';
      }
      if (obj.multiline != null) {
        flags += 'm';
      }
      if (obj.sticky != null) {
        flags += 'y';
      }
      return new RegExp(obj.source, flags);
    }
    newInstance = new obj.constructor();
    for (key in obj) {
      newInstance[key] = clone(obj[key]);
    }
    return newInstance;
  };

  util = {
    prop: prop,
    clone: clone
  };

  module.exports = util;

}).call(this);
