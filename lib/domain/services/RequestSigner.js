const _ = require('lodash');
const crypto = require('crypto');
const moment = require('moment');

/**
 * @type {{encode:function(string)}}
 */
const uri = require('urijs');

class RequestSigner {
    constructor(configuration, credentials) {
        this.configuration = configuration;
        this.credentials = credentials;
    }

    /**
     * @public
     * Sign request contains operation id and parameters.
     *
     * @param request
     * @return {string}
     */
    sign(request) {
        const timestamp = moment().format('YYYY-MM-DDTHH:mm:ssZ');
        const params = _.defaults(request, {
            AssociateTag: this.credentials.associateTag,
            AWSAccessKeyId: this.credentials.accessKey,
            Service: this.configuration.service,
            Timestamp: timestamp,
            Version: this.configuration.version
        });
        const normalized = this.normalize(params);
        const signature = this.encode(normalized);
        return `${this.configuration.protocol}://${this.configuration.endPoint}${this.configuration.uri}?${normalized}&Signature=${signature}`;
    }

    /**
     * @private
     * Encode and sort parameters.
     *
     * @param params
     * @return {string|*}
     */
    normalize(params) {
        return _.chain(params)
            .map((value, key) => [uri.encode(key), uri.encode(value)].join('='))
            .sort()
            .value()
            .join('&');
    }

    /**
     * @private
     * Encode normalized parameters.
     *
     * @param normalized
     * @return {*}
     */
    encode(normalized) {
        const source = [
            this.configuration.method,
            this.configuration.endPoint,
            this.configuration.uri,
            normalized
        ].join('\n');
        const hmac = crypto.createHmac('sha256', this.credentials.secretKey);
        hmac.update(source);
        return uri.encode(hmac.digest('base64'));
    }
}

module.exports = RequestSigner;
