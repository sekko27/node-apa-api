_ = require 'lodash'

EnumParameterDefinition = require './parameters/EnumParameterDefinition'
BooleanParameterDefinition = require './parameters/BooleanParameterDefinition'
StringParameterDefinition = require './parameters/StringParameterDefinition'
IntegerParameterDefinition = require './parameters/IntegerParameterDefinition'

DEFINITIONS = [
  new EnumParameterDefinition 'Condition', 'New', ['Used', 'Collectible', 'Refurbished', 'All', 'New']
  new EnumParameterDefinition 'IdType', 'ASIN', ['ASIN', 'SKU', 'EAN', 'ISBN', 'UPC']
  new BooleanParameterDefinition 'IncludeReviewsSummary', true
  new StringParameterDefinition 'ItemId', undefined, true
  new EnumParameterDefinition 'MerchantId', 'Amazon', ['Amazon']
  new IntegerParameterDefinition 'RelatedItemPage', 1, []
  new EnumParameterDefinition 'RelationshipType', undefined, [
    'AuthorityTitle'
    'DigitalMusicArranger'
    'DigitalMusicComposer'
    'DigitalMusicConductor'
    'DigitalMusicEnsemble'
    'DigitalMusicLyricist'
    'DigitalMusicPerformer'
    'DigitalMusicPrimaryArtist'
    'DigitalMusicProducer'
    'DigitalMusicRemixer'
    'DigitalMusicSongWriter'
    'Episode'
    'Season'
    'Tracks'
  ]
  new EnumParameterDefinition 'SearchIndex', 'All', [
    'All', 'Apparel', 'Appliances', 'ArtsAndCrafts', 'Automotive', 'Baby', 'Beauty', 'Blended', 'Books'
    'Classical', 'Collectibles', 'DigitalMusic', 'DVD', 'Electronics', 'ForeignBooks', 'Garden'
    'GroumetFoot', 'Grocery', 'HealthPersonalCare', 'Hobbies', 'Home', 'HomeGarden', 'HomeImprovement'
    'Home & Kitchen', 'Industrial', 'Jewelry', 'KindleStore', 'Kitchen', 'LawnAndGarden', 'Lighting'
    'Luggage', 'Magazines', 'Marketplace', 'Miscellaneous', 'MobileApps', 'MP3Downloads', 'Music'
    'MusicalInstruments', 'MusicTracks', 'OfficeProducts', 'OutdoorLiving', 'Outlet', 'PCHardware'
    'PetSupplies', 'Photo', 'Shoes', 'Software', 'SoftwareVideoGames', 'SportingGoods', 'Tools'
    'Toys', 'UnboxVideo', 'VHS', 'Video', 'VideoGames', 'Watches', 'Wireless', 'WirelessAccessories'
  ]
  new IntegerParameterDefinition 'TruncateReviewsAt', 1000, []
  new IntegerParameterDefinition 'VariationPage', undefined, (page) ->
    if not (1 <= page <= 150)
      throw "VariationPage has to belong to [1,150] range"
  new EnumParameterDefinition 'ResponseGroup', 'Small', [
    'Accessories'
    'BrowseNodes'
    'EditorialReview'
    'Images'
    'ItemAttributes'
    'ItemIds'
    'Large'
    'Medium'
    'OfferFull'
    'Offers'
    'PromotionSummary'
    'OfferSummary'
    'RelatedItems'
    'Reviews'
    'SalesRank'
    'Similarities'
    'Small'
    'Tracks'
    'VariationImages'
    'Variations'
    'VariationSummary'
  ]
]
class ItemLookupRequestParameters
  constructor: (@parameters) ->

  validate: ->
    _.reduce DEFINITIONS, reducer(@parameters), {}

module.exports = ItemLookupRequestParameters

reducer = (params) ->
  (memo, definition) ->
    name = definition.name
    value = definition.parameter(params[name]).value
    if not _.isUndefined(value)
      memo[name] = value
    memo

