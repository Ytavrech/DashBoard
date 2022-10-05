class ApplicantsController < ApplicationController
  before_action :find_applicant, only: %i{ accept decline }

  def index
    @applicants = Applicant.all
    @applicant = current_user.applicant
  end

  def create 
    @job = Job.find(params[:job_id])
    @applicant = @job.applicants.create(applicant_params) 
    redirect_to job_path(@job)
  end

  def show
    @job = Job.find(params[:job_id])
    @applicant = @job.applicant
  end

  def accept
    if @applicant.accepted!
      redirect_to job_path(@applicant), notice: "Offer accepted"
    else
      redirect_to job_path(@applicant), notice: "Offer could not be accepted - please try again"
    end
  end
  
  def decline
    # debugger
    if @applicant.rejected!
      redirect_to job_path(@applicant), notice: "Offer rejected"
    else
      redirect_to job_path(@applicant), notice: "Offer could not be rejected - please try again"
    end
  end

  def jobapplicant
    @job = Job.find(params[:job_id])
  end

  private
  def find_applicant
    @applicant = Applicant.find(params[:id])
  end


  def applicant_params
    params.require(:applicant).permit(:name, :lastname, :city, :phone)
  end
end