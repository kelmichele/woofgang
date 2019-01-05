class ApplicationController < ActionController::Base
	helper_method :user_ip
	# helper_method :localist

	# def localist
 #    localist = Location.all.reorder('state ASC')
 #  end

	def user_ip
		user_ip = request.remote_ip
		gon.user_ip = user_ip
	end

end
