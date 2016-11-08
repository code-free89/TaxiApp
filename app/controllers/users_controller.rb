class UsersController < ApplicationController

  # No create, a user is created via the registration process

  def edit
  end

  def update
    @user = User.find params[:id]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
  end

  def index
  end

  def show
  end

  private
  # Don't allow edits to password or email address here, this is only for profile items
  def user_params
    params.require(:user).permit(:fname, :lname, :addr1, :addr2, :town, :postcode, :county, :avatar, :phnum)
  end
end
