var qs = require("querystring");
var http = require("https");

var options = {
  "method": "POST",
  "hostname": [
    "accounts",
    "spotify",
    "com"
  ],
  "path": [
    "api",
    "token"
  ],
  "headers": {
    "authorization": "Basic {{client_credentials}}"
  }
};

var req = http.request(options, function (res) {
  var chunks = [];

  res.on("data", function (chunk) {
    chunks.push(chunk);
  });

  res.on("end", function () {
    var body = Buffer.concat(chunks);
    console.log(body.toString());
  });
});

req.write(qs.stringify({}));
req.end();