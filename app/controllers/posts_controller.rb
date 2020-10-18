class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :explain, :prefecture_id, :local, :price, :building, :other).merge(user_id: current_user.id)
  end

  def set_item
    @post = Post.find(params[:id])
  end
end
