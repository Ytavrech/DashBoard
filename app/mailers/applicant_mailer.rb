class ApplicantMailer < ApplicationMailer
    def new_applicant_email
        @job = params[:job]
        @user = params[:user]

        mail from: @user.email 
        mail to: @job.email
    end
end
