class ApplicantMailer < ApplicationMailer
    def new_applicant_email
        @job = params[:job]
        @user = params[:user]
        @applicant = params[:applicant]
        @applicant_id = params[:applicant_id]

        if @user.applicant?
          mail from: @user.email 
          mail to: @job.email
        else
          mail from: @job.email 
          mail to: @user.email
        end
    end
end
