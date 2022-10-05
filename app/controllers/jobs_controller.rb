class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @jobss= current_user.jobs.all
  end
  
  def new
    @job = Job.new
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def create
    @job = current_user.jobs.new(params.require(:job).permit(:title, :company,  :experience, :salary,:user_id))
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
    @job.update(title: params[:job][:title], company: params[:job][:company], experience: params[:job][:experience], salary: params[:job][:salary])
    redirect_to job_path(@job)
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
end
