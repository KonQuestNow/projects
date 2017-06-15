curl --request PUT \
  --url 'https://api.getpostman.com/environments/{{environment_id}}' \
  --header 'content-type: application/json' \
  --header 'x-api-key: {{postman_api_key}}' \
  --data '{
    "environment": {
        "values": {{updated_environment}}
    }
}'