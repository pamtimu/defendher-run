class RoutesController < ApplicationController
before_action :set_route, only: [:show]

  def index
    @routes = Route.all
  end

  def show
  end

  private

  def route_params
    params.require(:route).permit(:name, :description)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
