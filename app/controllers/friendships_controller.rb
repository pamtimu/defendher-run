class FriendshipsController < ApplicationController
  # before_action :set_friendship, only: [:show]


  def index
    @friendships = Friendship.where(user_one: current_user)
                              .or(Friendship.where(user_two: current_user))
                              .and(Friendship.where(accepted: 2))
                              .pluck(:user_one_id, :user_two_id)
                              .flatten
                              .reject { |id| id == current_user.id }
  end

  def new
    @new_friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.accepted = 0
    if @friendship.save
      flash[:notice] = "Friendship created successfully."
      redirect_to friendships_path(current_user)
    end
  end

  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:user_one_id, :user_two_id)
  end

end
