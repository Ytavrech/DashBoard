class JobsController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_job, only: %i{ accept decline }
  
  def index
    @jobs = Job.all  
    # @Applicants = Applicant.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params.require(:job).permit(:title, :company, :url, :experience, :salary))
    if @job.save
      redirect_to jobs_path
    else
      render "new"
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(title: params[:job][:title], company: params[:job][:company], url: params[:job][:url])
    redirect_to job_path(@job)
  end

  def accept
    # debugger
    if @job.accepted!
      redirect_to @job, notice: "Offer accepted"
    else
      redirect_to @job, notice: "Offer could not be accepted - please try again"
    end
  end

  def decline
    # debugger
    if @job.rejected!
      redirect_to @job, notice: "Offer rejected"
    else
      redirect_to @job, notice: "Offer could not be rejected - please try again"
    end
  end

  private

  def find_job
    @job = Job.find(params[:job_id])
  end
end
