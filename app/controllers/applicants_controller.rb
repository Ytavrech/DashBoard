class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all
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
