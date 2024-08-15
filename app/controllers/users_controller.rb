class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update_biography]

  def show
    
  end

  def update_biography
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:id, :photo, :biography)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
