class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all  
  end

  # def new
  #   @applicant = Applicant.new
  # end

  def create 
    # binding.pry
    
    # debugger
    @job = Applicant.find(params[:applicant_id]);
    @applicant = @job.applicants.create(applicant_params) 
    redirect_to job_path(@job)

    # @applicant = Applicant.new(params.require(:applicant).permit(:name, :lastname, :city ,:phone))
    # if @applicant.save
    #   redirect_to @applicant
    # else
    #   render :new
    # end

  end
  
  private
  def applicant_params
    params.require(:applicant).permit(:name, :lastname, :city, :phone)
  end

end