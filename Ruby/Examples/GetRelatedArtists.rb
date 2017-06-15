require 'uri'
require 'net/http'

url = URI("https://api.spotify.com/v1/artists/{{id}}/related-artists")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["authorization"] = 'Bearer {{authorization}}'

response = http.request(request)
puts response.read_body