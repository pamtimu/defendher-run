class RoutesController < ApplicationController
before_action :set_route, only: [:show]

  def index
    @routes = Route.all
    @markers = @routes.geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {route: route}),
        marker_html: render_to_string(partial: "marker")
      }
    end
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
