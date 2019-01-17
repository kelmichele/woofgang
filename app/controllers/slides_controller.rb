class SlidesController < ApplicationController
	before_action :set_slide, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :index]
  before_action :require_admin, only: [:edit, :update, :destroy, :new, :index]

	def index
		@slides = Slide.all
	end

	def new
    @slide = Slide.new
	end

	def sort
    params[:slide].each_with_index do |id, index|
      Slide.where(id: id).update_all(order: index + 1)
    end

    head :ok
  end


	def create
		@slide = Slide.new(slide_params)

		if @slide.save
		  redirect_to slides_path
		else
		  render 'new'
		end
	end

	def update
    if @slide.update(slide_params)
      redirect_to slides_path
    else
      render 'edit'
    end
  end

  def destroy
    Slide.find(params[:id]).destroy
    flash[:success] = "Slide was successfully deleted!"
    redirect_to slides_path
  end


	private
	def set_slide
		@slide = Slide.find(params[:id])
  end

  def slide_params
    params.require(:slide).permit(:image, :title, :order, :display, :link)
  end

  def require_admin
    if !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to slides_path
    end
  end
end
