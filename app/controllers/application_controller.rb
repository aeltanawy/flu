class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_if_not_found
  #rescue_from ActionController::RoutingError, with: :route_not_found

  # In case RecordNotFound
  def redirect_if_not_found
    logger.error "Attempt to access non-existent #{request.controller_class} '#{params[:id]}'."
    flash[:notice] = "Sorry, but #{request.controller_class} '#{params[:id]}' doesn't exist."
    redirect_to(root_path)
  end

  # In case RoutingError
  #def route_not_found
  #  logger.error "Attempt to access non-existent #{request.controller_class} '#{params[:id]}'."
  #  flash[:notice] = "The page you are trying to access doesn't exist."
  #  redirect_to(root_path)
  #end

end
