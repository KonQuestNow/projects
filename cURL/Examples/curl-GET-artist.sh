curl --request GET \
  --url 'https://api.spotify.com/v1/artists/{{id}}/related-artists' \
  --header 'accept: application/json' \
  --header 'authorization: Bearer {{authorization}}'