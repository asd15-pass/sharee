class MemosController < ApplicationController
  def index
    @memo = Memo.new
    @room = Room.find(params[:room_id])
    @memos = @room.memos.includes(:user)
  end
  def create
    @room = Room.find(params[:room_id])
    @memo = @room.memos.new(memo_params)
    if @memo.save
      redirect_to room_memos_path(@room)
    else
      @memos = @room.memos.includes(:user)
      render :index
    end
  end
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end
  private

  def memo_params
    params.require(:memo).permit(:content, :image).merge(user_id: current_user.id)
  end
end
