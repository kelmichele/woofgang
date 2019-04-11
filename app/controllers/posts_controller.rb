class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :show, :update, :destroy, :delete_image_attachment]
	helper_method :recent
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]


	def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 50)
  end

  def delete_image_attachment
    # @image = ActiveStorage::Attachment.find(params[:id])
    # @image = ActiveStorage::Blob.find(params[:id])
    @post.image.purge
    redirect_back(fallback_location: request.referer)
  end

  def import
    Post.import(params[:file])
    redirect_to blog_path, notice: 'Posts imported.'
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to blog_path
  end

  private
  def set_post
		@post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image, :content, :url, :date)
  end

  def recent
  	recent = Post.last(3)
  end

  def require_admin
    if !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to blog_path
    end
  end
end
