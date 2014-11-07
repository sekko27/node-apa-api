class ValueObject
  member: (name, value) ->
    Object.defineProperty @, name,
      get: -> value
      enumerable: true

module.exports = ValueObject
