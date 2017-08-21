
// Main app file that links everything together and runs the app

var express = require('express'),

      http = require('http');


var app = express();



// Configure config
var config = require('./config/config');


    app.set('port', config.port);
    app.set('views', __dirname + '/app/views');
    app.set('view engine', 'hbs');
    var hbs = require('hbs');
    hbs.registerPartials(__dirname + '/app/views/partials');

    const favicon = require('express-favicon');
    app.use(favicon(__dirname + '/public/favicon.png'));

    app.use(express.logger('dev'));
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(express.cookieParser('your secret here'));
    app.use(express.session());
    app.use(app.router);
    app.use(require('less-middleware')('/public'));
    app.use(express.static('./public'));



//!!!
//    app.use(express.errorHandler());
//!!!

// Configure routes
require('./config/routes')(app);


//http.createServer(app).listen(config.port), function(){
//  console.log("Express server listening on port " + config.port);
//};

app.listen(3000,function(){
    console.log("Live at Port 3000");
});
