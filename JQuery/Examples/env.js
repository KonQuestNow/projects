var settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://api.getpostman.com/environments/{{environment_id}}",
  "method": "PUT",
  "headers": {
    "x-api-key": "{{postman_api_key}}",
    "content-type": "application/json"
  },
  "data": "{\n    \"environment\": {\n        \"values\": {{updated_environment}}\n    }\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});