class SavedRoutesController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @saved_route = SavedRoute.new(route: @route, user: current_user)
    if @saved_route.save
      redirect_to saved_routes_path
    else
      render "routes/show"
    end
  end

  def index
    @saved_routes = current_user.saved_routes
  end

  def destroy
    @saved_route = SavedRoute.find(params[:id])
    @saved_route.destroy
    redirect_to saved_routes_path
  end
end
