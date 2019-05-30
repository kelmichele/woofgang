class StatesController < ApplicationController
	before_action :set_state, only: [ :edit, :update, :destroy, :show]
	before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]


	def index
		@states = State.all
	end

	def show
		@state_locations = @state.locations.all
		@states = State.all

		@locations =  @state_locations
		# .paginate(:page => params[:page], :per_page => 40)
    # @pagy, @locations = pagy(@state_locations.all, items: 109)
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

  def require_admin
    if !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to locations_path
    end
  end
end
