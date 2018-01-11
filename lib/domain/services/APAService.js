class APAService {
    constructor(requestFactories, signer, client) {
        this.requestFactories = requestFactories;
        this.signer = signer;
        this.client = client;
    }

    itemLookup(params) {
        return this.executeRequest('ItemLookup', params);
    }

    /**
     * @private
     * Execute request based on requestType param.
     *
     * @param requestType
     * @param params
     * @return {Promise.<>}
     */
    executeRequest(requestType, params) {
        return this.requestFactories[requestType].create(params)
            .then(request => this.signer.sign(request))
            .then(url => this.client.get(url));

    }
}

module.exports = APAService;
