class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :show, :update, :destroy]
	helper_method :recent

	def index
    @posts = Post.all
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

    redirect_to posts_path
  end

  private
  def set_post
		@post = Post.friendly.find(params[:id])
    # @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image, :content, :url, :date)
  end

  def recent
  	recent = Post.last(3)
  end
end
