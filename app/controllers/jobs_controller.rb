class JobsController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_job, only: %i{ accept decline }

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params.require(:job).permit(:title, :company, :url))

    if @job.save
      redirect_to root_path
    else
      render "new"
    end
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
      redirect_to @job, notice: 'Offer rejected'
    else
      redirect_to @job, notice: 'Offer could not be rejected - please try again' 
    end
  end

  private
  def find_job
    @job = Job.find(params[:job_id])
  end
end
