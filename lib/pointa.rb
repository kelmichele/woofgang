module Pointa
  require 'net/http'
  require 'json'

  def get_pointa ip_address
    pointa = Net::HTTP.get(URI("https://ipapi.co/#{ip_address}/json/"))

    JSON.parse(pointa)
  end

  module_function :get_pointa
end



