class ShopsController < ApplicationController
	before_action :set_shop, only: [:edit, :show, :update, :destroy]

	def index
		@states = State.all
    nearbys = Shop.near(params[:q], 350, :order => "distance")

		@shops = if params[:l]
			# JUST FOR REDO SEARCH
	    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	    box      = Geocoder::Calculations.bounding_box(center, distance)
	    Shop.within_bounding_box(box).paginate(:page => params[:page], :per_page => 9)

	  elsif params[:near]
	  	# for type search
	    Shop.near(params[:near], 20, :order => "distance").paginate(:page => params[:page], :per_page => 9)

	  elsif params[:q]
			nearbys.paginate(:page => params[:page], :per_page => 9)

	  else
	    Shop.all.paginate(:page => params[:page], :per_page => 50)
		end


		gon.result_info = if params[:near]
			if @shops.count > 0
				"#{@shops.count} " + 'shops within 20 miles of <b>"' + params[:near] + '"</b>'
			else
				'There are currently no shops in within 20 miles of <b>"' + params[:near] + '"</b>'
			end

		elsif params[:q]
			if @shops.count < 1
				"There are currently no shops within 20 miles of your area. Use the map above to search other areas."
			end

		else
			""
		end


		@tags = Tag.all

		respond_to do |format|
		  format.html
		  format.csv { send_data @shops.to_csv }
		end
	end

	def import
	  Shop.import(params[:file])
	  redirect_to shops_path, notice: 'Shops imported.'
	end

	def show
	end

	def new
    @shop = Shop.new
    @states = State.all
	end

	def create
		@shop = Shop.new(shop_params)
		if @shop.save
		  flash[:success] = "Shop was successfully created"
	    redirect_to shop_path(@shop)
		else
		  render 'new'
		  flash[:danger] = "Some Shops were not saved."
		end
	end

	def edit
	end

	def update
		if @shop.update(shop_params)
		  flash[:success] = "Shop was updated successfully."
	    redirect_to shop_path(@shop)
	    # redirect_to shops_path(@shop)
		else
		  render 'edit'
		end
	end

	def destroy
		Shop.find(params[:id]).destroy
  	flash[:success] = "Shop was successfully deleted!"
    redirect_to shops_path
	end

	private
	def set_shop
		@shop = Shop.friendly.find(params[:id])
		# @shop = Shop.find(params[:id])
	end

	def shop_params
    params.require(:shop).permit(:store_name, :email_address, :phone, :fb, :twitter, :insta, :yelp, :site, :street_address_one, :street_address_two, :city, :state, :zip, :hours, :latitude, :longitude, :tag_list, :tag, :state_id, { tag_ids: [] }, :tag_ids, :image)
  end
end
