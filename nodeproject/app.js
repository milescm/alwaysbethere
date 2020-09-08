// require express, make express object
var express = require('express');
var app = express();

// require request, xml-js
var request = require('request');
var convert = require('xml-js');



// // connection db pool
// var mysql = require('mysql');
// var connection = mysql.createConnection({
// 	host: 'localhost',
// 	port : 3306,
// 	user : 'root',
// 	password : '123123',
// 	database : 'EvCharger'
// });

// connection.connect(function(err){
// 	if(err) throw err;
// 	console.log('CONNECTED!');

// 	connection.query('select * from charger_info', (error, result) => {
// 		connection.end();

// 		if(error) throw err;

// 		return console.log(result);
// 	})
// });


// set servicekey, url, queryParams
//pageNo : 조회 페이지 정수 (기본값 1)
//pageSize : 1회 조회 최대 건수 (기본값 1000, 최소 100, 최대 10000)


var SERVICE_KEY = '0pNiR8HFfa0RQjcsNt6%2FP8owT6NomPGXZ6IfmxMPNqfjLlQ%2FX8Rv68n2e%2FaE%2BsgnyxT2uEsdP1OYUDivYnZuFQ%3D%3D';
var url = 'http://open.ev.or.kr:8080/openapi/services/EvCharger/getChargerInfo';
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + SERVICE_KEY;
queryParams += '&' + encodeURIComponent('serviceKey') + '=' + encodeURIComponent('-');
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
queryParams += '&' + encodeURIComponent('pageSize') + '=' + encodeURIComponent('100');

// Load data from openAPI
request({
    url: url + queryParams,
    method: 'GET'
}, function(error, response, body){
	if(error){
		console.log(`err=> ${err}`);
	}
	else{
		if(response.statusCode == 200){
			var result = body
			//console.log(`body data => ${result}`);
			var xmlToJson = convert.xml2json(result, {compact:true, spaces:4});
            // console.log(`xml to json => ${xmlToJson}`);
            //console.log(`${xmlToJson}`);
		}
	} 
});


// // // Redirection 통해서 파일 출력을 위한 테스트 코드
// fs = require('fs');
// var access = fs.createWriteStream(__dirname + '/api.access.json');
// process.stdout.write = process.stderr.write = access.write.bind(access);
// // 끝

// JSON 파일 읽어서 데이터 접근해보기 테스트 코드 
var fs = require('fs');
fs.readFile(__dirname + '/api.access.json', 'utf8', function(err, data){
    if (err) throw err;
    const dataJSON = JSON.stringify(data);
    const parsedData = JSON.parse(dataJSON);
    console.log(parsedData);
})
// 끝


app.listen(3000, function(){
    // console.log('Start! express server on port 3000');


});





