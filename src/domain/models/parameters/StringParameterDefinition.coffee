_ = require 'lodash'
ParameterDefinition = require './ParameterDefinition'

class StringParameterDefinition extends ParameterDefinition
  validate: (value) ->
    throw new Error("Invalid string value for #{@name} parameter: #{value}") if not _.isString(value)
    value

module.exports = StringParameterDefinition
