class UsersController < ApplicationController
  def edit
  end
  def update
    if current_user.update(user_params)
      redirect_to rooms_path
    else
      render :edit
    end
  end
  def new
    @users = Users.new
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end
  private

  def user_params
    params.require(:user).permit(:name, :email,:destroy ,user_ids: [] )
  end
end
