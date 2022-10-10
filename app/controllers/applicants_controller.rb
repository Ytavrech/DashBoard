class ApplicantsController < ApplicationController
  before_action :find_applicant, only: %i{ accept decline }
  before_action :find_job, only: %i{ create }

  def index
    @applicants = Applicant.all
  end

  def create
    @applicant = @job.applicants.create(applicant_params) 
    ApplicantMailer.with(user: current_user, job: @applicant.job.user, applicant: @applicant).new_applicant_email.deliver
    redirect_to jobs_path(@job)
  end

  def show
    # debugger
    @applicant = Applicant.find(params[:id])
  end

  def accept
    # debugger
    if @applicant.accepted!
      # ApplicantMailer.with(applicant_id: @job.applicant, job: @applicant.job.user, applicant: @applicant).new_applicant_email.deliver

      redirect_to job_path(@applicant), notice: "Offer accepted"
    else
      redirect_to job_path(@applicant), notice: "Offer could not be accepted - please try again"
    end
  end
  
  def decline
    # debugger
    # ApplicantMailer.with(user: current_user, applicant_id: @applicant.job, job: @applicant.job.user, applicant: @applicant).new_applicant_email.deliver

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

  def find_job
    @job = Job.find(params[:job_id])
  end

  def applicant_params
    params.require(:applicant).permit(:name, :lastname, :city, :phone)
  end
end