# require 'pointa'

class LocationsController < ApplicationController
	before_action :set_location, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
	# before_action :get_user_location
  helper_method :boss_admin

  def index
		@states = State.all
		
		# kp 9/12 -- uncomment for csv
		# @locations = Location.all
		# respond_to do |format|
		#   format.html
		#   format.csv { send_data @locations.to_csv, filename: "woof-locations.csv" }
		# end
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

	def location_params
    params.require(:location).permit(:store_name, :email_address, :phone, :fb, :twitter, :insta, :yelp, :site, :street_address_one, :street_address_two, :city, :state, :zip, :hours, :latitude, :longitude, :tag_list, :tag, :state_id, :coming_soon, { tag_ids: [] }, :tag_ids, :image)
  end

  def require_admin
    if !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to locations_path
    end
  end

  def boss_admin
  	@boss_admin ||= User.find_by(email: "kelli@hsdesignhouse.com")
  end
end
