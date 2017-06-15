import requests

url = "https://api.spotify.com/v1/artists/{{artist_id}}/top-tracks"

querystring = {"country":"{{country_code}}"}

headers = {
    'accept': "application/json",
    'authorization': "Bearer {{authorization}}"
    }

response = requests.request("GET", url, headers=headers, params=querystring)

print(response.text)