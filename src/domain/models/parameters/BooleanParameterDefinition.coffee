_ = require 'lodash'
ParameterDefinition = require './ParameterDefinition'

class BooleanParameterDefinition extends ParameterDefinition
  constructor: (name, defaultValue, required = false) ->
    super(name, defaultValue, required)

  validate: (value) ->
    if not _.isBoolean(value)
      throw new Error("Invalid boolean value for #{@name} parameter: #{value}")
    value

module.exports = BooleanParameterDefinition
