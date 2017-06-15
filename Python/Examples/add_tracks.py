import requests

url = "https://api.spotify.com/v1/users/{{user_id}}/playlists/{{playlist_id}}/tracks"

querystring = {"uris":"{{uris}}"}

headers = {
    'accept': "application/json",
    'authorization': "Bearer {{authorization}}",
    'content-type': "application/json"
    }

response = requests.request("POST", url, headers=headers, params=querystring)

print(response.text)