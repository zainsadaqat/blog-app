class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :photo)
  end
end
