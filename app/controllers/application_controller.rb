class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if :user_id && session[:user_id]
      puts :user_id
      puts session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
    end
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

end
