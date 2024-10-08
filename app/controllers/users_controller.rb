class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update_biography]

  def show
    @suggested_friends = User.where.not(id: current_user.id)
    @new_friendship = Friendship.new
    @coaches = current_user.coaches.where.not(program_content: [nil, ''])
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
