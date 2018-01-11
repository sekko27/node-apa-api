class RequestFactory {
    constructor(operation, definition) {
        this.operation = operation;
        this.definition = definition;
    }

    create(source) {
        return this.definition.prepare(source)
            .then(params => _.assign(params, {Operation: this.operation}));
    }
}

module.exports = RequestFactory;