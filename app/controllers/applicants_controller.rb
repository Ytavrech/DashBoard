class ApplicantsController < ApplicationController
  before_action :find_applicant, only: %i{ accept decline }
  before_action :find_job, only: %i{ create }
  # before_action :assign_user, only: %i{create}

  def index
    @curent_user = curent_user.id
    @applicants = Applicant.all
    @applicantss = @curent_user.applicants.all
  end
  # Applicant.last.job.user
  # Applicant.last.job
  def create
    # debugger

    @applicant = @job.current_user.applicants.create(applicant_params) 

    ApplicantMailer.with(user: current_user, job: @applicant.job.user, applicant: @applicant).new_applicant_email.deliver
    redirect_to jobs_path(@job)
  end

  def show
    @job = Job.find(params[:job_id])
    @applicant = @job.applicant
  end

  def accept
    if @applicant.accepted!
      debugger
      ApplicantMailer.with(user: current_user, job: @applicant.job.user, applicant: @applicant, applicant_id: @job.applicants.user).new_applicant_email.deliver

      redirect_to job_path(@applicant), notice: "Offer accepted"
    else
      redirect_to job_path(@applicant), notice: "Offer could not be accepted - please try again"
    end
  end
  
  def decline
    # debugger
    ApplicantMailer.with(user: current_user, job: @applicant.job.user, applicant: @applicant).new_applicant_email.deliver

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

  # def assign_user
  #   self.user_id = curent_user.id
  # end

  def find_job
    @job = Job.find(params[:job_id])
  end

  def applicant_params
    params.require(:applicant).permit(:name, :lastname, :city, :phone, :user_id)
  end
end