// Set up routes for the app

module.exports = function(app) {

	var index = require('../app/controllers/index');
	app.get('/', index.index);

    var auth = require('../app/controllers/auth');
    app.get(['/auth','/home'], auth.checksession)
    app.get('/auth/test', auth.test);
    app.get('/auth/login', auth.login);
    app.get('/auth/logout', auth.logout);
    app.post('/auth/login', auth.login);


 //   var dashboard = require('../app/controllers/test');
 //   app.get('/dashboard', test.dashboard);

 //    var test = require('../app/controllers/test');
 //    app.get('/test', test.index);



    var home = require('../app/controllers/home');
    app.get('/home', home.index);
    app.get('/home/test', home.test);


}

