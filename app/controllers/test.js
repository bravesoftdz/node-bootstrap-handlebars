
/*
 * GET tet page.
 */

exports.index = function(req, res){
    res.render('index', {title: 'TEST'});
};

exports.login = function(req, res){
    res.render('login');
};

exports.dashboard = function(req, res){
    res.render('dashboard');
};