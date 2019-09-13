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
		@vendors = Vendor.all
		respond_to do |format|
		  format.html
		  format.csv { send_data @vendors.to_csv, filename: "wgb-vendor-inquiries.csv" }
		end
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
		# @candidates = Candidate.all
		# respond_to do |format|
		#   format.html
		#   format.csv { send_data @candidates.to_csv, filename: "wgb-franchise-candidates.csv" }
		# end

		@reporters = Reporter.all
		respond_to do |format|
		  format.html
		  format.csv { send_data @reporters.to_csv, filename: "wgb-press-inquiries.csv" }
		end
	end

end
