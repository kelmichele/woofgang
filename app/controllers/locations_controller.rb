class LocationsController < ApplicationController
	before_action :set_location, only: [:edit, :show, :update, :destroy]

	def index
		# top 3 work
		# @latlng = 30.293,-87.543
		# @latlng = 28.843,-82.022
    # nearbys = Location.near(@latlng, 350, :order => "distance")
    @ct = Location.where(state: "CT").reorder('store_name ASC')
    @fl = Location.where(state: "FL").reorder('store_name ASC')
    @ga = Location.where(state: "GA").reorder('store_name ASC')
    @ks = Location.where(state: "KS").reorder('store_name ASC')
    @nc = Location.where(state: "NC").reorder('store_name ASC')
    @nj = Location.where(state: "NJ").reorder('store_name ASC')
    @nv = Location.where(state: "NV").reorder('store_name ASC')
    @ny = Location.where(state: "NY").reorder('store_name ASC')
    @sc = Location.where(state: "SC").reorder('store_name ASC')
    @tn = Location.where(state: "TN").reorder('store_name ASC')
    @tx = Location.where(state: "TX").reorder('store_name ASC')
    @va = Location.where(state: "VA").reorder('store_name ASC')
    @newj = Location.where(state: "New Jersey").reorder('store_name ASC')
    @vg = Location.where(state: "Virginia").reorder('store_name ASC')
    @fa = Location.where(state: "Florida").reorder('store_name ASC')
    @ff = Location.where(state: "FL ").reorder('store_name ASC')

    nearbys = Location.near(params[:q], 350, :order => "distance")

		@locations = if params[:l]
			# JUST FOR REDO SEARCH
	    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	    box      = Geocoder::Calculations.bounding_box(center, distance)
	    Location.within_bounding_box(box).paginate(:page => params[:page], :per_page => 15)

	  elsif params[:near]
	  	# for type search
	    Location.near(params[:near], 100, :order => "distance").paginate(:page => params[:page], :per_page => 5)

	  elsif params[:tag]
	    Location.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)

		elsif params[:q]
			nearbys.paginate(:page => params[:page], :per_page => 4)

	  else
	    Location.all.paginate(:page => params[:page], :per_page => 100)
		end

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
	    redirect_to location_path(@location)
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
    params.require(:location).permit(:store_name, :email_address, :phone, :fb, :twitter, :insta, :yelp, :site, :street_address_one, :street_address_two, :city, :state, :zip, :hours, :latitude, :longitude, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :image)
  end
end
