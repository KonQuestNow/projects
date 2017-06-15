curl --request POST \
  --url 'https://api.spotify.com/v1/users/{{user_id}}/playlists/{{playlist_id}}/tracks?uris={{uris}}' \
  --header 'accept: application/json' \
  --header 'authorization: Bearer {{authorization}}' \
  --header 'content-type: application/json'