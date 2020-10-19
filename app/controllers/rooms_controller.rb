class RoomsController < ApplicationController
  def index
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end

    @room = Room.new
    # @room = Room.new(params[post.user_id])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end
end
