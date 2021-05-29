require 'net/http'
require 'uri'
require 'openssl'

def set_ssl(url)
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http.start
end
 
url = "https://pbs.twimg.com/media/"
format_and_size = "?format=jpg&name=large"
http = set_ssl(url)
 
image1 = url + "Ex2qfbUUUAEmc5s" + format_and_size
image2 = url + "EvtFpKXVEAAvKkW" + format_and_size
image3 = url + "EvtEvUmVIAElRUT" + format_and_size
image4 = url + "Euf0ZLiUUAAXnnh" + format_and_size
image5 = url + "mjdfhg" + format_and_size
image6 = "afha"

(1..6).each do |i|
  begin
    path = eval("image#{i}")
    uri = URI.parse(path)
    req = Net::HTTP::Get.new(uri.request_uri)
    req["Connection"] = "Keep-Alive"
    puts http.request(req).code
  rescue => e
    raise "疎通エラー"
  end
end 

# => 200,200,200,200,404,ERROR
