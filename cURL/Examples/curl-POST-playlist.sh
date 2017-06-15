curl --request POST \
  --url 'https://api.spotify.com/v1/users/{{user_id}}/playlists' \
  --header 'accept: application/json' \
  --header 'authorization: Bearer {{authorization}}' \
  --header 'content-type: application/json' \
  --data '{
  "name": "{{artist_name}} Mix",
  "public": false
}'