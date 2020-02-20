class StaticPagesController < ApplicationController
	def home
		@slides = Slide.all

		@all_posts = Post.all
    respond_to do |format|
      format.html
      format.csv { send_data @all_posts.to_csv, filename: "woof-posts.csv" }
    end
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
	end

	def page
	end

end
