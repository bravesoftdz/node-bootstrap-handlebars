// Config file

var config = {};

config.port = process.env.PORT || 3000;

config.pgport = 5432;
config.pghost = '127.0.0.1';
config.pguser = 'postgres';
config.pgpass = 'postgres';
config.pgdb = 'cp';

module.exports = config;
