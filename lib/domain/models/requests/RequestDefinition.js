const _ = require('lodash');

class RequestDefinition {
    constructor(parameterDefinitions) {
        this.parameterDefinitions = parameterDefinitions;
    }

    prepare(parameters) {
        this.parameterDefinitions.reduce(
            (memo, def) => memo.then(r => def.pair(parameters[def.name]).then(v => _.isUndefined(v) ? memo : _.assign(memo, {[def.name]: v}))),
            Promise.resolve({})
        );
    }
}

module.exports = RequestDefinition;