class StaticPagesController < ApplicationController
	def home
		@slides = Slide.all
	end

	def doggie_daycare
	end

	def grooming
	end

	def retail
	end

	def self_service_grooming
	end

	def vet_clinic
	end

	def page
	end

end
