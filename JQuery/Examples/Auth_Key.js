var settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://accounts.spotify.com/api/token",
  "method": "POST",
  "headers": {
    "authorization": "Basic {{client_credentials}}"
  },
  "data": {}
}

$.ajax(settings).done(function (response) {
  console.log(response);
});