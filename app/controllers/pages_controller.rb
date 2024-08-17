class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @routes = Route.all
    if params[:query].present?
      @searched_routes = @routes.search_by_name_and_address(params[:query])
    end
    @markers = @routes.geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {route: route}),
        marker_html: render_to_string(partial: "marker")
      }
    end
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

  def suggested_friends
    @users = User.all
  end
end
