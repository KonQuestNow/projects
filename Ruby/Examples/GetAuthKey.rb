require 'uri'
require 'net/http'

url = URI("https://accounts.spotify.com/api/token")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["authorization"] = 'Basic {{client_credentials}}'

response = http.request(request)
puts response.read_body