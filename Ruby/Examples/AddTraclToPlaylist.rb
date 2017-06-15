require 'uri'
require 'net/http'

url = URI("https://api.spotify.com/v1/users/{{user_id}}/playlists/{{playlist_id}}/tracks?uris={{uris}}")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["accept"] = 'application/json'
request["authorization"] = 'Bearer {{authorization}}'
request["content-type"] = 'application/json'

response = http.request(request)
puts response.read_body