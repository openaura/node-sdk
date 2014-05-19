util = require("./prop")

class ParticleCollection
  constructor: (ps) ->
    @_data = util.clone(ps)

  map: (fn) ->
    fn(p) for p in ps

  select: (fn) ->
    p for p in ps when fn(p)
      
module.exports = ParticleCollection
