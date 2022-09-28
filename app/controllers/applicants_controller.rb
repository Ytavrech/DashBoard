class ApplicantsController < ApplicationController
  def index
    @jobs = Job.all  
    @applicant = Applicant.all
    # render :controller => 'jobs', :action => 'index'
  end

  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(params.require(:applicant).permit(:name, :lastname, :city ,:phone))

    if @applicant.save
      redirect_to root_path
    else
      render "new"
    end
  end


end
