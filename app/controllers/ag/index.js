/* 
Description:
©® Pletnev G.G.
mailto: Gregory@Pletnev.biz
*/


const {Pool} = require('pg');
var config = require('../../../config/config');

const pool = new Pool({
    user: config.pguser,
    host: config.pghost,
    database: config.pgdb,
    password: config.pgpass,
    port: config.pgport
})

/*
 * GET AG Index.
 */

exports.index = function(req, res){
    //res.render('index', {title: 'AG'});
    const data = {
        cookie: req.cookies.session
    };


    pool.query('SELECT g.id as g_id,g.name as g_name,g.code as g_code, g.email as g_email, g.comment as g_comment FROM ref_ag_guests g inner join ref_object_owners oo on oo.object_id=g.object_id inner join tmp_sys_sessions ss on oo.user_id=ss.user_id where ss.id=$1 and g.state=0 and oo.state=0', [data.cookie], (err, r) => {
        if (err) {
            console.log('SQL error');
            return console.error('Error executing query', err.stack);
           // res.render('login');
            console.log('error geting holders 1');
        }
        else {
          //  var menu = '<li class="active"><a href="#">Home</a></li>';
          //  for (var i = 0; i < result.rowCount; i++) {
            console.log(r.rows);
          //      console.log(result.rows[i].path);
          //      menu = menu + '<li><a href="' + result.rows[i].path + '">' + result.rows[i].name + '</a></li>';
            res.render('ag/guestlist',r.rows);
           // }

        }

    })

};




exports.addGuest = function(req, res){
    //res.render('index', {title: 'AG'});
    const data = {
        cookie: req.cookies.session,
        g_id: req.body.g_id,
        g_firstname: req.body.g_firstname,
        g_surname: req.body.g_surname,
        g_lastname: req.body.g_lastname,
        g_code: req.body.g_code,
        g_discount: req.body.g_discount,
        g_bonus: req.body.g_bonus,
        g_phone: req.body.g_phone,
        g_email: req.body.g_email,
        g_address: req.body.g_address,
        g_comment: req.body.g_comment,
        g_tags: req.body.g_tags,
        g_color: req.body.g_color

    };

    if (data.g_id===undefined){
        console.log('Got NO ID');
        res.render('ag/guestcard');
    }
    else{
        console.log('Got ID');
        pool.query('SELECT g.id as g_id,g.name as g_name,g.code as g_code FROM ref_ag_guests g inner join ref_object_owners oo on oo.object_id=g.object_id inner join tmp_sys_sessions ss on oo.user_id=ss.user_id where ss.id=$1 and g.state=0 and oo.state=0', [data.cookie], (err, r) => {
            if (err) {
                console.log('SQL error');
                return console.error('Error executing query', err.stack);
                // res.render('login');
                console.log('error geting holders 1');
            }
            else {
                //  var menu = '<li class="active"><a href="#">Home</a></li>';
                //  for (var i = 0; i < result.rowCount; i++) {
                console.log(r.rows[0]);
                //      console.log(result.rows[i].path);
                //      menu = menu + '<li><a href="' + result.rows[i].path + '">' + result.rows[i].name + '</a></li>';
                res.render('ag/guestcard',r.rows[0]);
                // }

            }

        })

    }



};


exports.getGuest = function(req, res){
    //res.render('index', {title: 'AG'});
    const data = {
        cookie: req.cookies.session,
        g_id: req.query.g_id
    };
    pool.query('SELECT ' +
        'g.id as g_id,g.name as g_name,' +
        'g.code as g_code, ' +
        'g.email as g_email, ' +
        'g.address as g_address, ' +
        'g.comment as g_comment, ' +
        'g.tags as g_tags, ' +
        'd.name as g_discount_name, '+
        'd.code as g_discount_code, '+
        'g.discount_id as g_discount, ' +
        'b.name as g_bonus_name, '+
        'b.code as g_bonus_code, '+
        'g.bonus_id as g_bonus ' +
        'FROM ref_ag_guests g ' +
        'inner join ref_object_owners oo on oo.object_id=g.object_id ' +
        'inner join tmp_sys_sessions ss on oo.user_id=ss.user_id ' +
        'left join ref_rk_bonuses b on b.id=g.bonus_id '+
        'left join ref_rk_discounts d on d.id=g.discount_id '+
        'where ' +
        'ss.id=$1 and g.state=0 and oo.state=0 and g.id=$2', [data.cookie, data.g_id], (err, r) => {
        if (err) {
            console.log('SQL error');
            return console.error('Error executing query', err.stack);
            // res.render('login');
            console.log('error geting holders 1');
        }
        else {
            //  var menu = '<li class="active"><a href="#">Home</a></li>';
            //  for (var i = 0; i < result.rowCount; i++) {
            console.log(r.rows[0]);
            //      console.log(result.rows[i].path);
            //      menu = menu + '<li><a href="' + result.rows[i].path + '">' + result.rows[i].name + '</a></li>';
            res.render('ag/guestcard',r.rows[0]);
            // }

        }

    })

};