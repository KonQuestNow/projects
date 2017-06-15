var settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://api.spotify.com/v1/users/{{user_id}}/playlists/{{playlist_id}}/tracks?uris={{uris}}",
  "method": "POST",
  "headers": {
    "accept": "application/json",
    "authorization": "Bearer {{authorization}}",
    "content-type": "application/json"
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});