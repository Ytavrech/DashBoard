class ApplicantMailer < ApplicationMailer
    def new_applicant_email
        @job = params[:job]
        @user = params[:user]
        @applicant = params[:applicant]
        @applicant_id = params[:applicant_id]

            
            mail from: @user.email
            mail to: @job.email

    end
end
