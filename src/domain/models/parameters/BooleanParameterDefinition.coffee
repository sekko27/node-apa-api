_ = require 'lodash'
ParameterDefinition = require './ParameterDefinition'

class BooleanParameterDefinition extends ParameterDefinition
  validate: (value) ->
    if not _.isBoolean(value)
      throw new Error("Invalid boolean value for #{@name} parameter: #{value}")
    value

module.exports = BooleanParameterDefinition
