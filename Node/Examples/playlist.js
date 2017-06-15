var http = require("https");

var options = {
  "method": "POST",
  "hostname": [
    "api",
    "spotify",
    "com"
  ],
  "path": [
    "v1",
    "users",
    "{{user_id}}",
    "playlists"
  ],
  "headers": {
    "accept": "application/json",
    "authorization": "Bearer {{authorization}}",
    "content-type": "application/json"
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

req.write(JSON.stringify({ name: '{{artist_name}} Mix', public: false }));
req.end();