class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all

  end

  # GET /driver_page
  def driver_page
    @profiles = Profile.all
  end


  # GET /profiles/id
  # GET /profile.json
  def show
    # If no profile is found, just create a new one
    if !@profile
      redirect_to new_profile_path
    end
  end


  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/edit
  def edit
  end

  # POST /profile
  # POST /profile.json
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

  # PATCH/PUT /profiles
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/profile
  # DELETE /users/1/profile.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Profile was successfully destroyed.' }
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
      params.require(:profile).permit(:lname, :fname, :user_id, :addr1, :addr2, :phnum, :town, :postcode, :avatar, :county, :carpic, :reg, :role) if params[:profile]
    end

end
