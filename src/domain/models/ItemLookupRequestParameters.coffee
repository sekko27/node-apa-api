_ = require 'lodash'
EnumParameterDefition = require './parameters/EnumParameterDefition'
BooleanParameterDefinition = require './parameters/BooleanParameterDefinition'
StringParameterDefinition = require './parameters/StringParameterDefinition'
IntegerParameterDefinition = require './parameters/IntegerParameterDefinition'

DEFINITIONS = [
  new EnumParameterDefition 'Condition', 'New', ['Used', 'Collectible', 'Refurbished', 'All', 'New']
  new EnumParameterDefition 'IdType', 'ASIN', ['ASIN', 'SKU', 'EAN', 'ISBN', 'UPC']
  new BooleanParameterDefinition 'IncludeReviewsSummary', true
  new StringParameterDefinition 'ItemId', undefined, true
  new EnumParameterDefition 'MerchantId', 'Amazon', ['Amazon']
  new IntegerParameterDefinition 'RelatedItemPage', 1, []
  new EnumParameterDefition 'RelationshipType', undefined, [
    'AuthorituTitle'
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
  new EnumParameterDefition 'SearchIndex', 'All', [
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
  new EnumParameterDefition 'ResponseGroup', 'Small', [
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
    keys = _.pluck DEFINITIONS, 'name'
    values = _.map DEFINITIONS, (definition) =>
      name = definition.name
      definition.parameter(@parameters[name])
    _.zipObject(keys, values)

module.exports = ItemLookupRequestParameters

