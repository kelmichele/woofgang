class StaticPagesController < ApplicationController

	def doggie_daycare
	end

	def grooming
	end

	def home
	end

	def retail
	end

	def self_service_grooming
	end

	def vet_clinic
	end

	def page
		@locations = Location.all
  	@ct = Location.where(state: "CT")
  	@fl = Location.where(state: "FL")
  	@ga = Location.where(state: "GA")
  	@ks = Location.where(state: "KS")
  	@nc = Location.where(state: "NC")
  	@nj = Location.where(state: "NJ")
  	@nv = Location.where(state: "NV")
  	@ny = Location.where(state: "NY")
  	@sc = Location.where(state: "SC")
  	@tn = Location.where(state: "TN")
  	@tx = Location.where(state: "TX")
  	@va = Location.where(state: "VA")
	end

end
