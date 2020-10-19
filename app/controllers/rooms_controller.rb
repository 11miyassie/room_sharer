class RoomsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end
end
