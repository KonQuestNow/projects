require 'uri'
require 'net/http'

url = URI("https://api.spotify.com/v1/artists/{{artist_id}}/top-tracks?country={{country_code}}")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["authorization"] = 'Bearer {{authorization}}'

response = http.request(request)
puts response.read_body