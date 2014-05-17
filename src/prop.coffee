prop = (obj, propName) ->
  propAr  = propName.split(".")
  head    = propAr.shift()
  tailStr = propAr.join(".")

  if typeof obj != 'undefined' and obj != null and obj.hasOwnProperty(head) and typeof obj[head] != 'undefined' and obj[head] != null
    if propAr.length
      prop(obj[head], tailStr)
    else
      obj[head]
  else
    null

clone = (obj) ->
  if not obj? or typeof obj isnt 'object'
    return obj

  if obj instanceof Date
    return new Date(obj.getTime()) 

  if obj instanceof RegExp
    flags = ''
    flags += 'g' if obj.global?
    flags += 'i' if obj.ignoreCase?
    flags += 'm' if obj.multiline?
    flags += 'y' if obj.sticky?
    return new RegExp(obj.source, flags) 

  newInstance = new obj.constructor()

  for key of obj
    newInstance[key] = clone obj[key]

  return newInstance

util =
  prop: prop
  clone: clone

module.exports = util
