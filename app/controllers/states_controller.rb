class StatesController < ApplicationController
	before_action :set_state, only: [ :edit, :update, :destroy, :show]

	def index
		@states = State.all
	end

	def show
		@state_locations = @state.locations.all
		@states = State.all

		@locations =  @state_locations.paginate(:page => params[:page], :per_page => 9)
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
