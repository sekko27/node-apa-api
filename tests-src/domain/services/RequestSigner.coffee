fs = require 'fs'
Helper = require('wire-context-helper').Helper()
TestHelper = require('wire-context-helper').Helper('tests')
APIMeta = require Helper.model('APIMeta')
Credential = require Helper.model('Credential')
Request = require Helper.model('Request')
Signer = require Helper.service('RequestSigner')

chai = require 'chai'
assert = chai.assert
promised = require 'chai-as-promised'
chai.use promised

describe 'RequestSigner', ->
  apiMeta = null
  credential = null
  signer = new Signer()

  before (done) ->
    apiMeta = new APIMeta()
    fs.readFile TestHelper.path('configs/test-credentials.json'), encoding: 'utf8', (err, config) ->
      return done(err) if err
      c = JSON.parse config
      credential = new Credential c.accessKey, c.secretKey, c.associateTag
      done()

  it 'should sign requests', ->
    request = new Request(apiMeta, credential, 'Operation')
    console.log signer.sign(request)