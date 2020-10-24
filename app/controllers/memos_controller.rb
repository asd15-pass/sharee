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
    @user = current_user
    @room = Room.find(params[:room_id])
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to room_memos_path(@room.id)

  end
  private

  def memo_params
    params.require(:memo).permit(:content,:image).merge(user_id: current_user.id)
  end
end
