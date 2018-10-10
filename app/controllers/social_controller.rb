class SocialController < ApplicationController
	def insta
		redirect_to('https://www.instagram.com/WoofGangBakery/')
	end

	def fb
		redirect_to('https://www.facebook.com/woofgangbakery?v=wall&#038;mid=20b6a56G2a7f6d23G0G66')
	end

	def twitter
		redirect_to('https://twitter.com/WoofGangBakery')
	end

	def in
		redirect_to('https://www.linkedin.com/company/woofgangbakery/')
	end

	def pin
		redirect_to('https://www.pinterest.com/woofgangbakery/')
	end

	def phone
		4073559210
	end

end
