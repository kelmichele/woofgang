class StoresController < ApplicationController
	before_action :set_store, only: [:edit, :show, :update, :destroy]

	def index
		coords = "35.941764, -86.922942"

		@states = State.all
    nearbys = Store.near(params[:q], 350, :order => "distance")

		@stores = if params[:l]
			# JUST FOR REDO SEARCH
	    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	    box      = Geocoder::Calculations.bounding_box(center, distance)
	    Store.within_bounding_box(box).paginate(:page => params[:page], :per_page => 9)

	  elsif params[:near]
	  	# for type search
	    Store.near(params[:near], 20, :order => "distance").paginate(:page => params[:page], :per_page => 9)

	  elsif params[:tag]
	    Store.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 9)

	  elsif params[:q]
			nearbys.paginate(:page => params[:page], :per_page => 9)

	  else
	    # Store.all.paginate(:page => params[:page], :per_page => 9)
	    Store.near(coords, 200).paginate(:page => params[:page], :per_page => 9)
		end


		gon.result_info = if params[:near]
			if @stores.count > 0
				"#{@stores.count} " + 'stores within 20 miles of <b>"' + params[:near] + '"</b>'
			else
				'There are currently no stores in within 20 miles of <b>"' + params[:near] + '"</b>'
			end

		elsif params[:q]
			if @stores.count < 1
				"There are currently no stores within 20 miles of your area. Use the map above to search other areas."
			end

		else
			""
		end


		@tags = Tag.all

		respond_to do |format|
		  format.html
		  format.csv { send_data @stores.to_csv }
		end
	end

	def import
	  Store.import(params[:file])
	  redirect_to stores_path, notice: 'Stores imported.'
	end

	def show
	end

	def new
    @store = Store.new
    @states = State.all
	end

	def create
		@store = Store.new(store_params)
		if @store.save
		  flash[:success] = "Store was successfully created"
	    redirect_to store_path(@store)
		else
		  render 'new'
		  flash[:danger] = "Some Stores were not saved."
		end
	end

	def edit
	end

	def update
		if @store.update(store_params)
		  flash[:success] = "Store was updated successfully."
	    redirect_to store_path(@store)
	    # redirect_to stores_path(@store)
		else
		  render 'edit'
		end
	end

	def destroy
		Store.find(params[:id]).destroy
  	flash[:success] = "Store was successfully deleted!"
    redirect_to stores_path
	end

	private
	def set_store
		@store = Store.friendly.find(params[:id])
		# @store = Store.find(params[:id])
	end

	def store_params
    params.require(:store).permit(:store_name, :email_address, :phone, :fb, :twitter, :insta, :yelp, :site, :street_address_one, :street_address_two, :city, :state, :zip, :hours, :latitude, :longitude, :tag_list, :tag, :state_id, { tag_ids: [] }, :tag_ids, :image)
  end
end
