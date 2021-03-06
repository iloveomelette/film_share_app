class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :likes).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :recommendation, :image)
  end
end
