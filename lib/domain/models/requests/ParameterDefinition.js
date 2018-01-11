const _ = require('lodash');

class ParameterDefinition {
    constructor(name, filters = []) {
        this.name = name;
        this.filters = filters;
    }

    pair(value) {
        return this.prepare(value).then(v => _.isUndefined(v) ? undefined : [this.name, v]);
    }

    prepare(value) {
        return this.filters.reduce((chain, filter) => chain.then(filter), Promise.resolve(value))
            .catch(err => Promise.reject(`Parameter "${this.name}": ${err}`));
    }
}

module.exports = ParameterDefinition;