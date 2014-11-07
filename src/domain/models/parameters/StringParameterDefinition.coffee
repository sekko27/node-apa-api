_ = require 'lodash'
ParameterDefinition = require './ParameterDefinition'

class StringParameterDefinition extends ParameterDefinition
  constructor: (name, defaultValue, required = false) ->
    super(name, defaultValue, required)

  validate: (value) ->
    throw new Error("Invalid string value for #{@name} parameter: #{value}") if not _.isString(value)
    value

module.exports = StringParameterDefinition
