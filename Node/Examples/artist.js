var http = require("https");

var options = {
  "method": "GET",
  "hostname": [
    "api",
    "spotify",
    "com"
  ],
  "path": [
    "v1",
    "artists",
    "{{id}}"
  ],
  "headers": {
    "accept": "application/json",
    "authorization": "Bearer {{authorization}}"
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

req.end();