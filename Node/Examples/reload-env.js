var http = require("https");

var options = {
  "method": "PUT",
  "hostname": [
    "api",
    "getpostman",
    "com"
  ],
  "path": [
    "environments",
    "{{environment_id}}"
  ],
  "headers": {
    "x-api-key": "{{postman_api_key}}",
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

req.write("{\n    \"environment\": {\n        \"values\": {{updated_environment}}\n    }\n}");
req.end();