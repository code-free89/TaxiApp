class SessionsController < ApplicationController
  def new
  end

  def create
    respond_to do |format|

      user = User.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        session[:user_id] = user.id
        format.html { redirect_to root_path, notice: 'You have successfully logged in.' }
      else
        # If user's login doesn't work, send them back to the login form.
        format.html { redirect_to login_path, notice: 'Email address / password not recognised, have you verified the password and registered your email address?' }
      end
    end

  end

  def destroy
    respond_to do |format|
      session[:user_id] = nil
      format.html { redirect_to root_path, notice: 'You have successfully logged out.' }
    end
  end
end
