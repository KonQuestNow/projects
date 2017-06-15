require 'uri'
require 'net/http'

url = URI("https://api.getpostman.com/environments/{{environment_id}}")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["x-api-key"] = '{{postman_api_key}}'
request["content-type"] = 'application/json'
request.body = "{\n    \"environment\": {\n        \"values\": {{updated_environment}}\n    }\n}"

response = http.request(request)
puts response.read_body