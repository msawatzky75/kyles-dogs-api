class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActionController::RoutingError, with: :not_found

  def raise_not_found
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end

  def not_found
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/index.html", layout: false, status: :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end
end
