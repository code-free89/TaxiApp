class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profile = current_user.profile
  end

  # GET /users/1/profile
  # GET /users/1/profile.json
  def show
    # If no profile is found, just create a new one

  if !@profile
      redirect_to new_profile_path
    end
  end

  # GET /users/1/profiles/new
  def new
    @profile = Profile.new
    # @profile = current_user.profile.new(profile_params)

  end

  # GET /users/1/profiles/edit
  def edit
  end

  # POST /users/1/profile
  # POST /users/1/profile.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_path, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1/profile
  # PATCH/PUT /users/1/profile.json
  def update
    response = @profile.update(profile_params)

    respond_to do |format|
      if response
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to profile_path
  end

  # DELETE /users/1/profile
  # DELETE /users/1/profile.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find_by_user_id(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:lname, :fname, :user_id, :addr1, :addr2, :phnum, :town, :postcode, :avatar, :county) if params[:profile]
    end
end
