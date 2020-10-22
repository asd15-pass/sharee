class RoomsController < ApplicationController
  def index
  end
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
      if @room.save
        render :index
      else
        render :new
      end
  end
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end
    private

  def room_params
    params.require(:room).permit(:name,:destroy ,user_ids: [])
  end
end
