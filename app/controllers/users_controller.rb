class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @coaches = current_user.coaches.where.not(program_content: [nil, ''])
  end

  private

  def user_params
    params.require(:user).permit(:id, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
