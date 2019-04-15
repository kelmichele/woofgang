class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user
	helper_method :ip_one

	include Pagy::Backend

	def ip_one
		ip_one = request.remote_ip
   	gon.req_remote = ip_one
	end
end
