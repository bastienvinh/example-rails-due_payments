class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # rescue_from ActionController::RoutingError :render_lost_ways

  # def render_lost_ways
  # end
end
