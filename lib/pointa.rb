module Pointa
  require 'net/http'
  require 'json'

  def get_pointa 
    pointa = Net::HTTP.get(URI("https://ipapi.co/json/"))

    JSON.parse(pointa)
  end

  module_function :get_pointa
end



