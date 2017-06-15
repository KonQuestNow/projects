import requests

url = "https://api.getpostman.com/environments/{{environment_id}}"

payload = "{\n    \"environment\": {\n        \"values\": {{updated_environment}}\n    }\n}"
headers = {
    'x-api-key': "{{postman_api_key}}",
    'content-type': "application/json"
    }

response = requests.request("PUT", url, data=payload, headers=headers)

print(response.text)