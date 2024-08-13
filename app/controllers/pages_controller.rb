class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  
  def home
  end

  def updates
    @chatrooms = Chatroom.where(user_one: current_user) + Chatroom.where(user_two: current_user)
    @messages = @chatrooms.map do |chatroom|
      chatroom.messages.order(created_at: :desc).first
    end
      @friendships = Friendship.where(user_one: current_user)
      @friendships.map do |friendship|
    end
  end

  def saved_routes
    @routes = current_user.routes
  end
end
