class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :arrived, :enroute, :set_status]
  before_action :set_children, only: [:show, :edit, :update, :arrived, :enroute, :set_status]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.select { |job| job.status != 'archived' }
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @drivers =  Profile.select { |profile| profile.role == 'driver' }
    @customers = Profile.select { |profile| profile.role == 'customer' }
  end

  # GET /jobs/1/edit
  def edit
    @drivers = Profile.all
    @customers = Profile.all
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.status = :open

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /jobs/1/arrived
  def arrived
    set_status
  end

  # PUT /jobs/1/set_status
  def set_status
    send_mail
    puts "==========================="
    puts "PARAMS: "
    puts @job.id
    puts job_params
    # puts :status
    puts "==========================="

    respond_to do |format|
      # if @job.update(params[:status])
      if @job.update_attributes(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated with driver arrival.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { redirect_to @job, notice: 'Failed to set job to arrived state.' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /jobs/1/enroute
  def enroute
    send_mail

    respond_to do |format|
      if @job.update(id: @job.id, status:'driver_en_route' )
        format.html { redirect_to @job, notice: 'Job was successfully updated with driver arrival.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { redirect_to @job, notice: 'Failed to set job to arrived state.' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    puts "==========================="
    puts "PARAMS: "
    puts @job.id
    puts params[:status]
    puts job_params
    puts "==========================="


    respond_to do |format|
      if @job.update(job_params)

        if @job.status == 'arrived'
          send_mail
        end
        format.html { redirect_to jobs_url, notice: 'Job successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_mail
    CustomerMailer.arrived_email(@driver, @customer).deliver
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def set_children
      @driver = Profile.find(@job.driver_id)
      @customer = Profile.find(@job.customer_id)
      @location1 = Address.find(@job.location1_id)
      @location2 = Address.find(@job.location2_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:driver_id, :customer_id, :pickup_time, :location1_id, :location2_id, :status) if params[:job]
    end
end
