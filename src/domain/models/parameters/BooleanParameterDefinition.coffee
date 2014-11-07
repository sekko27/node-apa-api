_ = require 'lodash'
ParameterDefinition = require './ParameterDefinition'

class BooleanParameterDefinition extends ParameterDefinition
  constructor: (name, defaultValue, required = false) ->
    super(name, defaultValue, required)

  validate: (value) ->
    throw new Error("Invalid boolean value for #{@name} parameter: #{value}") if not _.isBoolean(value)
    value

module.exports = BooleanParameterDefinition
