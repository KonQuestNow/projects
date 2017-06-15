var settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://api.spotify.com/v1/artists/{{artist_id}}/top-tracks?country={{country_code}}",
  "method": "GET",
  "headers": {
    "accept": "application/json",
    "authorization": "Bearer {{authorization}}"
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});