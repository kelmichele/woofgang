class SlidesController < ApplicationController
	before_action :set_slide, only: [:edit, :update, :destroy]

	def index
		@slides = Slide.all
	end

	def new
    @slide = Slide.new
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
    @slide.destroy
    redirect_to slides_path
  end


	private
	def set_slide
		@slide = Slide.find(params[:id])
  end

  def slide_params
    params.require(:slide).permit(:image, :title)
  end
end
