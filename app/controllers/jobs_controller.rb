class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @applicants = Applicant.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(params.require(:job).permit(:title, :company,  :experience, :salary))
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
  
  def home 
  end

  def jobpost
    @job = Job.find(params[:job_id])
    # @applicant=@job.applicants.find(params[:id])
  end
  
  private
  
  def find_job
    @job = Job.find(params[:job_id])
  end
end
