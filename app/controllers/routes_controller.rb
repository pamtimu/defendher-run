class RoutesController < ApplicationController
before_action :set_route, only: [:show]

  def index
    @routes = Route.all
  end

  def show
  end

  def saved_routes
    @routes = Route.all
  end

  private

  def route_params
    params.require(:route).permit(:name, :description)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
