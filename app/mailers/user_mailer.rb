class UserMailer < ApplicationMailer
    default from: "from@example.com"

    def example(user)
        @user = user
        mail(to: @user.email, subject: 'Test Email for Letter Opener')
      end
end
