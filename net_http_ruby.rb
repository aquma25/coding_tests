require 'net/http'
require 'uri'

url = "https://www.tagindex.com/html_tag/link/image/neko_s.jpg"
puts Net::HTTP.get_response(URI.parse(url)).code

