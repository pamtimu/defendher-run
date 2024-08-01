class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def saved_routes
    # @saved_routes = SavedRoute.where(user_id: current_user.id)
    @routes = current_user.routes
  end

end
