fs = require 'fs'
Helper = require('wire-context-helper').Helper()
TestHelper = require('wire-context-helper').Helper('tests')
APIMeta = require Helper.model('APIMeta')
Credential = require Helper.model('Credential')
Request = require Helper.model('ItemLookupRequest')
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

  it 'should sign requests properly', ->
    request = new Request(apiMeta, credential, ItemId: '0124166903', '2014-10-31T13:26:16+01:00')
    assert.equal signer.sign(request), 'http://webservices.amazon.com/onca/xml?AWSAccessKeyId=AKIAI2DV3QSFN3EQPC7A&AssociateTag=tellico-20&ItemId=0124166903&Operation=ItemLookup&Service=AWSECommerceService&Timestamp=2014-10-31T13%3A26%3A16%2B01%3A00&Version=2011-08-01&Signature=YCfw9%2FTQ60OWCbq0IIJCkwe1WOetsQ4S002yEwC8JNs%3D'

