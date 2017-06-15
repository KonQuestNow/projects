var settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://api.spotify.com/v1/users/{{user_id}}/playlists",
  "method": "POST",
  "headers": {
    "accept": "application/json",
    "authorization": "Bearer {{authorization}}",
    "content-type": "application/json"
  },
  "processData": false,
  "data": "{\n  \"name\": \"{{artist_name}} Mix\",\n  \"public\": false\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});