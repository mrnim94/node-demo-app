var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('!Hello World! - Test v3');
});

var server = app.listen(80, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening on port %s', port);
});
