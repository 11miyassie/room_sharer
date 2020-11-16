class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  before_action :move_to_show, only: [:edit, :destroy, :update]
  before_action :search_post, only: [:index, :search]
  before_action :set_prefecture_column, only: [:index, :search]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order('created_at DESC')
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @post.destroy
  end

  def search
    @results = @p.result.includes(:prefecture).order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :explain, :prefecture_id, :local, :price, :building, :other).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_show
    redirect_to action: :show if user_signed_in? == false || @post.user_id != current_user.id
  end

  def search_post
    @p = Post.ransack(params[:q])
  end

  def set_prefecture_column
    @prefecture_name = Prefecture.select("name").distinct
  end
end