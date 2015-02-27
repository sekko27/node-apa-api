_ = require 'lodash'
ParameterDefinition = require './ParameterDefinition'

class IntegerParameterDefinition extends ParameterDefinition
  constructor: (name, defaultValue, validators, required = false) ->
    super(name, defaultValue, required)
    @member('validators', if _.isArray(validators) then validators else [validators])

  validate: (value) ->
    intValue = parseInt(value)
    if isNaN(value)
      throw new Error("Invalid integer parameter for #{@name} parameter: #{value}")
    _.invoke @['validators'], 'call', null, intValue
    intValue

module.exports = IntegerParameterDefinition
