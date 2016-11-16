class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  def authorize
    redirect_to '/login' unless current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    referrer = request.referrer
    url = if !referrer.blank? && referrer != request.url
            referrer
          else
            root_url
          end

    redirect_to url
  end

end
