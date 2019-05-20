class StaticPagesController < ApplicationController
	def home
		@slides = Slide.all
	end

	def doggie_daycare
	end

	def grooming
	end

	def retail
	end

	def self_service_grooming
	end

	def vet_clinic
	end

	def blog
    # @posts = Post.all.paginate(:page => params[:page], :per_page => 12)
		# @pagy, @records = pagy(Product.some_scope, some_option: 'some option for this instance')
    @pagy, @posts = pagy(Post.all, items: 12)

    respond_to do |format|
      format.html
      format.csv { send_data @posts.to_csv }
    end
	end

	def page
	  @states = State.all
	end

end
