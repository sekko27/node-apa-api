Properties = require './Properties'

class Credential extends Properties
  constructor: (options) ->
    super(
      options,
      {
        accessKey: ''
        secretKey: ''
        associateTag: ''
      }
    )

module.exports = Credential
