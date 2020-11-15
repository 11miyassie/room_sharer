class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  before_action :move_to_show, only: [:edit, :destroy, :update]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
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
    if @post.destroy
      redirect_to posts_path
    else
      render :show
    end
  end

  def search
    @results = @p.result.includes(:prefecture)
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
end

  def search_post
    @p = Post.ransack(params[:q])
  end

  def set_prefecture_column
    @prefecture_name = Prefecture.select("name").distinct
  end