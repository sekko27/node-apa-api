const {
    ApplyDefaultValue,
    IsString,
    IsBoolean,
    IsInteger,
    InRange,
    IsEnumeration,
    IgnoreDefaultValue
} = require('./filters/package');

const ParameterDefinition = require('./ParameterDefinition');
const RequestDefinition = require('./RequestDefinition');

class ItemLookupRequestDefinition extends RequestDefinition {
    static get PARAM_DEFINITIONS() {
        return [
            new ParameterDefinition('Condition', [
                ApplyDefaultValue('New'),
                IsString,
                IsEnumeration(['Used', 'Collectible', 'Refurbished', 'All', 'New']),
                IgnoreDefaultValue('New')
            ]),
            new ParameterDefinition('IdType', [
                ApplyDefaultValue('ASIN'),
                IsString,
                IsEnumeration(['ASIN', 'SKU', 'EAN', 'ISBN', 'UPC']),
                IgnoreDefaultValue('ASIN')
            ]),
            new ParameterDefinition('IncludeReviewsSummary', [
                ApplyDefaultValue(true),
                IsBoolean,
                IgnoreDefaultValue(true)
            ]),
            new ParameterDefinition('ItemId', [
                IsString
            ]),
            new ParameterDefinition('MerchantId', [
                ApplyDefaultValue('Amazon'),
                IsString,
                IgnoreDefaultValue
            ]),
            new ParameterDefinition('RelatedItemPage', [
                ApplyDefaultValue(1),
                IsInteger,
                IgnoreDefaultValue(1)
            ]),
            new ParameterDefinition('RelationshipType', [
                ApplyDefaultValue('_'),
                IsEnumeration([
                    '_',
                    'AuthorityTitle',
                    'DigitalMusicArranger',
                    'DigitalMusicComposer',
                    'DigitalMusicConductor',
                    'DigitalMusicEnsemble',
                    'DigitalMusicLyricist',
                    'DigitalMusicPerformer',
                    'DigitalMusicPrimaryArtist',
                    'DigitalMusicProducer',
                    'DigitalMusicRemixer',
                    'DigitalMusicSongWriter',
                    'Episode',
                    'Season',
                    'Tracks'
                ]),
                IgnoreDefaultValue('_')
            ]),
            new ParameterDefinition('SearchIndex', [
                ApplyDefaultValue('All'),
                IsEnumeration([
                    'All',
                    'Apparel',
                    'Appliances',
                    'ArtsAndCrafts',
                    'Automotive',
                    'Baby',
                    'Beauty',
                    'Blended',
                    'Books',
                    'Classical',
                    'Collectibles',
                    'DigitalMusic',
                    'DVD',
                    'Electronics',
                    'ForeignBooks',
                    'Garden',
                    'GroumetFoot',
                    'Grocery',
                    'HealthPersonalCare',
                    'Hobbies',
                    'Home',
                    'HomeGarden',
                    'HomeImprovement',
                    'Home & Kitchen',
                    'Industrial',
                    'Jewelry',
                    'KindleStore',
                    'Kitchen',
                    'LawnAndGarden',
                    'Lighting',
                    'Luggage',
                    'Magazines',
                    'Marketplace',
                    'Miscellaneous',
                    'MobileApps',
                    'MP3Downloads',
                    'Music',
                    'MusicalInstruments',
                    'MusicTracks',
                    'OfficeProducts',
                    'OutdoorLiving',
                    'Outlet',
                    'PCHardware',
                    'PetSupplies',
                    'Photo',
                    'Shoes',
                    'Software',
                    'SoftwareVideoGames',
                    'SportingGoods',
                    'Tools',
                    'Toys',
                    'UnboxVideo',
                    'VHS',
                    'Video',
                    'VideoGames',
                    'Watches',
                    'Wireless',
                    'WirelessAccessories'
                ])
            ]),
            new ParameterDefinition('TruncateReviewsAt', [
                ApplyDefaultValue(1000),
                IsInteger,
                IgnoreDefaultValue(1000)
            ]),
            new ParameterDefinition('VariationPage', [
                ApplyDefaultValue(0),
                IsInteger,
                InRange(1, 150),
                IgnoreDefaultValue(0)
            ]),
            new ParameterDefinition('ResponseGroup', [
                ApplyDefaultValue('Small'),
                IsString,
                IsEnumeration([
                    'Accessories',
                    'BrowseNodes',
                    'EditorialReview',
                    'Images',
                    'ItemAttributes',
                    'ItemIds',
                    'Large',
                    'Medium',
                    'OfferFull',
                    'Offers',
                    'PromotionSummary',
                    'OfferSummary',
                    'RelatedItems',
                    'Reviews',
                    'SalesRank',
                    'Similarities',
                    'Small',
                    'Tracks',
                    'VariationImages',
                    'Variations',
                    'VariationSummary'
                ])
            ])
        ];
    }

    constructor() {
        super(ItemLookupRequestDefinition.PARAM_DEFINITIONS);
    }
}

module.exports = ItemLookupRequestDefinition;
