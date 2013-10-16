class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
  	@posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post was saved."
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    # binding pry
  #  @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
  #  @post = Post.find(params[:id])
  end
  
  def update
  #  @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post was updated!"
    else
      render :edit
    end
  end

  def destroy
  end
  
  private 

  def post_params
    params.require(:post).permit(:title, :url, :description, categories_id: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
