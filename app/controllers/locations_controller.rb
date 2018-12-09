class LocationsController < ApplicationController
	before_action :set_location, only: [:edit, :show, :update, :destroy]

	def index
		@locations = if params[:l]
	    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	    box      = Geocoder::Calculations.bounding_box(center, distance)
	    Location.within_bounding_box(box).paginate(:page => params[:page], :per_page => 6)

	  elsif params[:near]
	    Location.near(params[:near], 50).paginate(:page => params[:page], :per_page => 6)

	  elsif params[:tag]
	    Location.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 9)

	  else
	    Location.all.paginate(:page => params[:page], :per_page => 100)
		end
		# @locations = @locations.paginate(:page => params[:page], :per_page => 10)

		@tags = Tag.all

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
	    redirect_to locations_path(@location)
		else
		  render 'new'
		  flash[:danger] = "Some Locations were not saved."
		end
	end

	def edit
	end

	def update
		if @location.update(location_params)
		  flash[:success] = "Location was updated successfully."
	    redirect_to location_path(@location)
	    # redirect_to locations_path(@location)
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
		@location = Location.friendly.find(params[:id])
		# @location = Location.find(params[:id])
	end

	def location_params
    params.require(:location).permit(:store_name, :email_address, :phone, :fb, :twitter, :insta, :yelp, :site, :street_address_one, :street_address_two, :city, :state, :zip, :hours, :latitude, :longitude, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end
