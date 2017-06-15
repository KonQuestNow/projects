import requests

url = "https://api.spotify.com/v1/artists/{{id}}/related-artists"

headers = {
    'accept': "application/json",
    'authorization': "Bearer {{authorization}}"
    }

response = requests.request("GET", url, headers=headers)

print(response.text)