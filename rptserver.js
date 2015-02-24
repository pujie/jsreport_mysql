var express = require('express');
var Q = require('q');
var app = express();
var request = require("request");
app.get('/survey/:id',function(req,res){
	var mysql	  = require('./node_modules/node-mysql/node_modules/mysql');
	var connection = mysql.createConnection({
 		host : 'localhost',
		user : 'teknis',
		password : 'teknis',
		database : 'teknis'
	});
	connection.connect();
	function getRequest(){
		var defered = Q.defer();
		connection.query('SELECT id,username from users',defered.makeNodeResolver());
		return defered.promise;
	}
	function getClient(){
		var defered = Q.defer();
		connection.query('SELECT id,name from clients where id = '+req.params.id,defered.makeNodeResolver());
		return defered.promise;
	}
	function getSites(){
		var defered = Q.defer();
		connection.query('SELECT id,pic_name,pic_position,pic_phone_area,pic_phone,address from survey_sites where survey_request_id='+req.params.id,defered.makeNodeResolver());
		return defered.promise;
	}
	Q.all([getRequest(),getClient(),getSites()]).then(function(results){
		console.log(JSON.stringify(results[2][0]));
			request({
				url:'http://localhost:4000/api/report',
				json:true,
				method:'POST',
				body:{
					template:{
					shortid:"QkkIjxlv"
				},
				options:{authorization:{grantWrite:true}},
				data:{
					"receiverAddress":results[1][0][0].address,
					"name":results[1][0][0].name,
					"business_field":results[1][0][0].business_field,
					"items":results[2][0]
				}
			}
			}).pipe(res);
	});
	connection.end();
});
require("jsreport").bootstrapper({
	express : { 
	app : app
	},
	httpPort:4000
}).start();
