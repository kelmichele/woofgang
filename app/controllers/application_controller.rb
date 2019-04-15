class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user
	helper_method :request_ip

	include Pagy::Backend

	def request_ip
		@request_ip = request.ip
   	gon.req_premote = @request_ip
	end
end
