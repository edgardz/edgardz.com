'use strict';

exports.use = function (app) {
    app.get('/500', function(req, res, next) {
        next(new Error('forced error'));
    });
};