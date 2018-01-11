class Credentials {
    constructor(accessKey, secretKey, associateTag) {
        this.accessKey = accessKey;
        this.secretKey = secretKey;
        this.associateTag = associateTag;
    }

    asParams() {
        return {
            AssociateTag: this.associateTag,
            AWSAccessKeyId: this.accessKey
        }
    }
}

module.exports = Credentials;
