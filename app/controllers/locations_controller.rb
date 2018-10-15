class LocationsController < ApplicationController
	before_action :set_location, only: [:edit, :show, :update, :destroy]

	# def index
	# 	@locations = Location.all

	# 	respond_to do |format|
	# 	  format.html
	# 	  format.csv { send_data @locations.to_csv }
	# 	end
	# end

	def index
		@locations = if params[:l]
	    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	    box      = Geocoder::Calculations.bounding_box(center, distance)
	    Location.within_bounding_box(box)
	  elsif params[:near]
	    Location.near(params[:near], 50)
	  else
	    Location.all
		end
		@locations = @locations.paginate(:page => params[:page], :per_page => 10)

		respond_to do |format|
		  format.html
		  format.csv { send_data @locations.to_csv }
		end
	end


	def import
	  Location.import(params[:file])
	  redirect_to locations_path, notice: 'Locations imported.'
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
      params.require(:location).permit(:store_name, :email_address, :phone, :street_address_one, :street_address_two, :city, :state, :zip, :hours, :latitude, :longitude)
    end
end
