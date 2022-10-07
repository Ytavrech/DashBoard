class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @jobss= current_user.jobs.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
 
  def new
    @job = Job.new
  end
   
  def create
    @job = current_user.jobs.new(job_params)
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
    @job.update(job_params)
    redirect_to jobs_path(@job)
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private
  def find_job
    @job = Job.find(params[:job_id])
  end
  def job_params
    params.require(:job).permit(:title, :company,  :experience, :salary,:user_id)
  end
end
