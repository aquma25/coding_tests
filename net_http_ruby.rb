require 'net/http'
require 'uri'

url = "https://www.tagindex.com/html_tag/link/image/neko_s.jpg"
begin
  puts Net::HTTP.get_response(URI.parse(url)).code == "200" ? "true!!" : "false!!"
rescue
  puts "error_false!!"
end

