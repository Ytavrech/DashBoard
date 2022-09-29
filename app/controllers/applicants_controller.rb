class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all  
    # render :controller => 'jobs', :action => 'index'
  end

  def new
    @applicant = Applicant.new
  end

  def create 
    @Applicant = Applicant.find(params[:applicant_id])    
    @job = @applicant.jobs.create(params[:job]) 

    # @applicant = Applicant.new(params.require(:applicant).permit(:name, :lastname, :city ,:phone))

    if @job.save
      redirect_to root_path
    else
      render "new"
    end
  end


end
