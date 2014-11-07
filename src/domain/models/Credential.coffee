ValueObject = require './ValueObject'

class Credential extends ValueObject
  constructor: (accessKey, secretKey, associateTag) ->
    @member 'accessKey', accessKey
    @member 'secretKey', secretKey
    @member 'associateTag', associateTag

module.exports = Credential
