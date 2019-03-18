module Pointa
  require 'net/http'
  require 'json'

  def get_pointa ip_address
    # pointa = Net::HTTP.get(URI("https://ipapi.co/#{ip_address}/json/"))
    pointa = Net::HTTP.get(URI("ipinfo.io"))
    # pointa = ("https://api.ipapi.com/api/check?access_key=" + Rails.application.credentials.ipapi[:ipapi_access])

    JSON.parse(pointa)
  end

  module_function :get_pointa
end



