class ApplicantsController < ApplicationController
  before_action :find_job, only: %i{ accept decline }
  def index
    @applicants = Applicant.all  
    @jobs = Job.all  
  end

  # def new
  #   @applicant = Applicant.new
  # end

  def create 
    # binding.pry
    
    # debugger
    @job = Job.find(params[:job_id])
    @applicant = @job.applicants.create(applicant_params) 
    redirect_to job_path(@job)

    # @applicant = Applicant.new(params.require(:applicant).permit(:name, :lastname, :city ,:phone))
    # if @applicant.save
    #   redirect_to @applicant
    # else
    #   render :new
    # end
  end

  def accept
    # debugger
    if @applicant.accepted!
      redirect_to @applicant, notice: "Offer accepted"
    else
      redirect_to @applicant, notice: "Offer could not be accepted - please try again"
    end
  end
  
  def decline
    # debugger
    if @job.rejected!
      redirect_to @applicant, notice: "Offer rejected"
    else
      redirect_to @applicant, notice: "Offer could not be rejected - please try again"
    end
  end

  
  private
  def applicant_params
    params.require(:applicant).permit(:name, :lastname, :city, :phone)
  end

  def find_job
    @applicant = Applicant.find(params[:applicant_id])
  end
end