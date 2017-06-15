import requests

url = "https://api.spotify.com/v1/artists/{{id}}"

headers = {
    'accept': "application/json",
    'authorization': "Bearer {{authorization}}"
    }

response = requests.request("GET", url, headers=headers)

print(response.text)