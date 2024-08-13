class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :create]


  def index
    @friendships = Friendship.where(user_one: current_user)

  end

  def show_friendship
    @friend = @friendship.friend
    # @friendship = Friendship.find(params[:id])
  end


  def create
    @friendship = current_user.friendships.build(friend: @friend)
    if @friendship.save
      flash[:notice] = "Friendship created successfully."
      redirect_to friendships_path(current_user)
    end
  end

  private

  def set_friendship
    @friendship = current_user.friendships.find_by(id: params[:id])
  end

end
