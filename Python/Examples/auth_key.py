import requests

url = "https://accounts.spotify.com/api/token"

payload = ""
headers = {'authorization': 'Basic {{client_credentials}}'}

response = requests.request("POST", url, data=payload, headers=headers)

print(response.text)