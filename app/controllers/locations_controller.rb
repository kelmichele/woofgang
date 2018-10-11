class LocationsController < ApplicationController
	before_action :set_location, only: [:edit, :show, :update, :destroy]

	def index
		@locations = Location.all
	end


	def show
	end

	def new
    @location = Location.new
	end

	def create
		@location = Location.new(location_params)
		if @location.save
		  flash[:success] = "Location was successfully created"
	    redirect_to locations_path
		else
		  render 'new'
		  flash[:danger] = "Some Locations were not saved."
		end
	end

	def edit
	end

	def update
		if @location.update(location_params)
		  flash[:success] = "Location was updated successfully. You may close this tab."
	    redirect_to locations_path
		else
		  render 'edit'
		end
	end

	def destroy
		Location.find(params[:id]).destroy
  	flash[:success] = "Location was successfully deleted!"
    redirect_to locations_path
	end

	private
		def set_location
			@location = Location.find(params[:id])
		end

		def location_params
      params.require(:location).permit(:street, :suite, :city, :state, :zip, :phone, :latitude, :longitude)
    end
end


