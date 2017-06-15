curl --request GET \
  --url 'https://api.spotify.com/v1/artists/{{artist_id}}/top-tracks?country={{country_code}}' \
  --header 'accept: application/json' \
  --header 'authorization: Bearer {{authorization}}'