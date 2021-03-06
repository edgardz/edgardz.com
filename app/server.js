'use strict';

var
express = require('express'),
i18n    = require('i18next'),
app     = express(),
port    = 8080,
env     = app.get('env');

i18n.init({ 
    preload: ['pt','en'],
    resGetPath: __dirname + '/model/locales/__ns__-__lng__.json'
});

app.set('views', __dirname + (env === 'production' ? '/views/production' : '/views/development') );
app.set('view engine', 'jade');

app.use(express.logger());
app.use(express.compress());
app.use(express.methodOverride());
app.use(express.bodyParser());
app.use(i18n.handle);
app.use(app.router);

// static content
app.use(express.static(__dirname + '/views/static'));
app.use(express.static(__dirname + (env === 'production' ? '/views/production' : '/views/development')));

i18n.registerAppHelper(app);

// general 404
app.use(function(req, res, next) {
    res.status(404);
    res.render('404', { url: req.url });
});

// general error
app.use(function(err, req, res, next) {
    res.status(err.status || (err.status = 500));
    console.error('Server all error catcher: ', err);
    res.render('error', {
      data: err,
      message: err.message
    });
});

// controllers
require("fs").readdirSync("./controllers").forEach(function(file) {
    if(file.indexOf('.js') !== -1) {
        require("./controllers/" + file).use(app);
    }
});

app.listen(port);

console.log('Listening ' + port);


