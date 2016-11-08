class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # result = @user.save
    # if (result)
    #   redirect_to root_url
    # else
    #   puts @user.errors.full_messages
    #   redirect_to new_user_path
    # end

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'You have successfully registered and logged in.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :'users/new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Get /users/1/logout
  def logout
    @user = nil
    redirect_to root_url
  end

  # Using for debugging, won't normally show all users in prod!
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully de-registered.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_digest, :salt)
  end
end
