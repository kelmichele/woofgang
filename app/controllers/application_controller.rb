class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user
	helper_method :home_loc

	include Pagy::Backend

	def home_loc
  	home_loc = request.env['HTTP_X_FORWARDED_FOR']
  	gon.home_loc = home_loc
  end

end
