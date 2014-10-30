class Credential
  constructor: (accessKey, secretKey, associateTag) ->
    Object.defineProperty @, 'accessKey', get: -> accessKey
    Object.defineProperty @, 'secretKey', get: -> secretKey
    Object.defineProperty @, 'associateTag', get: -> associateTag

module.exports = Credential
