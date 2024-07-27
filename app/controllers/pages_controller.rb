class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def saved_routes
    @routes = Route.all
  end

end
