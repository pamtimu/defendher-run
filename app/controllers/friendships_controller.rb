class FriendshipsController < ApplicationController
  # before_action :set_friendship, only: [:show]
  before_action :set_friendship, only: [:accept, :reject]


  def index
    @friendships = current_user.friendships.select do |friendship|
      friendship.accepted == "accepted"
    end
  end

  def new
    @new_friendship = Friendship.new
  end

  def create
    @user_one = User.find(friendship_params[:user_one_id])
    @user_two = User.find(friendship_params[:user_two_id])
    @friendship = @user_one.friendship_with @user_two
    if @friendship
      flash[:notice] = "You are already friends"
      redirect_to friendships_path(current_user)
    else
      @friendship = Friendship.new(friendship_params)
      @friendship.accepted = 1
      if @friendship.save
        flash[:notice] = "Friendship created successfully."
        redirect_to friendships_path
      end
    end
  end

  def accept
    @friendship.accepted = 2
    @friendship.save
    flash[:notice] = "Friendship accepted"
    redirect_to friendships_path
  end

  def reject
    @friendship.accepted = 0
    @friendship.save
    flash[:notice] = "Friendship rejected"
    redirect_to friendships_path
  end

  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:user_one_id, :user_two_id)
  end

end
