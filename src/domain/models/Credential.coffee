Properties = require './Properties'

class Credential extends Properties
  constructor: (options) ->
    return new Credential(options) if not @
    super(
      options,
      {
        accessKey: ''
        secretKey: ''
        associateTag: ''
      }
    )

module.exports = Credential
