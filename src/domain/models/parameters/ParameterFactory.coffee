_ = require 'lodash'
ValueObject = require './../ValueObject'

class Parameter extends ValueObject
  constructor: (value) ->
    @member('value', value)

STRING_CACHE = {}
NUMERIC_CACHE = {}
CONSTANTS =
  undefined: new Parameter(undefined)
  true:  new Parameter(true)
  false: new Parameter(false)
  null:  new Parameter(null)

cached = (cache, value) ->
  if not cache[value]
    cache[value] = new Parameter(value)
  cache[value]

module.exports = (value) ->
  switch
    when _.isUndefined(value) then CONSTANTS.undefined
    when _.isNull(value) then CONSTANTS.null
    when _.isBoolean(value)
      if value == true then CONSTANTS.true else CONSTANTS.false
    when _.isString(value)
      cached STRING_CACHE, value
    when _.isNumber(value)
      cached NUMERIC_CACHE, value
    else
      throw Error("Invalid parameter value")

