require 'pointa'

class LocationsController < ApplicationController
	before_action :set_location, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

	def index
		pointa = get_user_location
		@user_lng = pointa["longitude"]
    @user_lat = pointa["latitude"]
   	crds = [@user_lat, @user_lng]

   	gon.user_station = crds

		@states = State.all
    nearbys = Location.near(params[:q], 20, :order => "distance")
    neighbors = Location.near(crds, 100, :order => "distance")
    # 60

		@locations = if params[:l]
			# JUST FOR REDO SEARCH
	    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	    box      = Geocoder::Calculations.bounding_box(center, distance)
	    Location.within_bounding_box(box)

	  elsif params[:near]
	  	# for type search
	    # Location.near(params[:near], 20, :order => "distance").paginate(:page => params[:page], :per_page => 9)
	    Location.near(params[:near], params[:proximity], :order => "distance")

	  elsif params[:tag]
	    #ADDED ORDER, 3/12
	    Location.tagged_with(params[:tag]).near([@user_lat, @user_lng], 1200, :order => "distance")
	    # Location.near([@user_lat, @user_lng], 60, select: "locations.*, tags.*").joins(:tags).paginate(:page => params[:page], :per_page => 9)

	  else
	    # neighbors.all.paginate(:page => params[:page], :per_page => 110)
	    Location.near(crds, 450, :order => "distance")
		end
    @pagy, @locations = pagy(@locations, items: 9)

		@tags = Tag.find(9,1,2,3,0)


		# @locCount = Location.all.count
		gon.result_info = if params[:near]
			# search
			'location(s) within ' + params[:proximity] + ' miles of <b>"' + params[:near] + '"</b>'
		else
			" "
		end

		

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
    @states = State.all
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
	end

	def get_user_location
	  # ip_address = request.remote_ip
  	# ip_address = "192.96.192.142"
  	ip_address = Net::HTTP.get(URI("https://ipapi.co/ip/"))
    Pointa.get_pointa ip_address
  end

	def location_params
    params.require(:location).permit(:store_name, :email_address, :phone, :fb, :twitter, :insta, :yelp, :site, :street_address_one, :street_address_two, :city, :state, :zip, :hours, :latitude, :longitude, :tag_list, :tag, :state_id, :coming_soon, { tag_ids: [] }, :tag_ids, :image)
  end

  def require_admin
    if !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to locations_path
    end
  end
end
