Helper = require('wire-context-helper').Helper()

module.exports =
  Service: require Helper.Service('APA')
  APIMeta: require Helper.model('APIMeta')
  Credential: require Helper.model('Credential')
  DefaultSigner: require Helper.service('RequestSigner')