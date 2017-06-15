import requests

url = "https://api.spotify.com/v1/users/{{user_id}}/playlists"

payload = "{\n  \"name\": \"{{artist_name}} Mix\",\n  \"public\": false\n}"
headers = {
    'accept': "application/json",
    'authorization': "Bearer {{authorization}}",
    'content-type': "application/json"
    }

response = requests.request("POST", url, data=payload, headers=headers)

print(response.text)