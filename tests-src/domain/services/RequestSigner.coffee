Helper = require('wire-context-helper').Helper()
APIMeta = require Helper.model('APIMeta')
Credential = require Helper.model('Credential')
Operations = require Helper.model('Operations')
RequestFactory = require Helper.model('RequestFactory')
Signer = require Helper.service('RequestSigner')
credentialConfiguration = require Helper.path("configs/test-credentials")

{assert} = require 'chai'

describe 'RequestSigner', ->
  requestFactory = new RequestFactory(new APIMeta(), new Credential(credentialConfiguration))
  signer = new Signer()

  it 'should sign requests properly', ->
    request = requestFactory.newInstance(Operations.ITEM_LOOKUP, {ItemId: '0124166903'}, {timestamp: '2014-10-31T13:26:16+01:00'})
    assert.equal signer.sign(request), 'http://webservices.amazon.com/onca/xml?AWSAccessKeyId=AKIAJ7KOQXVZ5KAY36HQ&AssociateTag=tellico-20&ItemId=0124166903&Operation=ItemLookup&Service=AWSECommerceService&Timestamp=2014-10-31T13%3A26%3A16%2B01%3A00&Version=2011-08-01&Signature=ddB6fupAIcxKaXxhrkVFMPC0Kxd04TOANpXOvNRncwc%3D'

