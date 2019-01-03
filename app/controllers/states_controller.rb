class StatesController < ApplicationController
	before_action :set_state, only: [ :edit, :update, :destroy, :show]

	def index
		@states = State.all
	end

	def show
		@state_locations = @state.locations.all
		@states = State.all

		@locations = if params[:l]
			# JUST FOR REDO SEARCH
	    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	    box      = Geocoder::Calculations.bounding_box(center, distance)
	    Location.within_bounding_box(box).paginate(:page => params[:page], :per_page => 9)

	  elsif params[:near]
	  	# for type search
	    Location.near(params[:near], 100, :order => "distance").paginate(:page => params[:page], :per_page => 9)

	  elsif params[:tag]
	    Location.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 9)

		elsif params[:q]
			nearbys.paginate(:page => params[:page], :per_page => 9)

	  else
	    @state_locations.paginate(:page => params[:page], :per_page => 9)
		end
	end

	def new
    @state = State.new
	end

	def create
    @state = State.new(state_params)
    if @state.save
      flash[:success] = "State was successfully created"
      redirect_to state_path(@state)
    else
      render 'new'
    end
	end

	def edit
	end

	def update
		if @state.update(state_params)
		  flash[:success] = "State was updated successfully"
      redirect_to state_path(@state)
		else
		  render 'edit'
		end
	end

	def destroy
		State.find(params[:id]).destroy
  	flash[:success] = "State was successfully deleted!"
    redirect_to states_path
	end

	private
	def set_state
		@state = State.friendly.find(params[:id])
	end

	def state_params
    params.require(:state).permit(:name, :full_name)
  end
end
