class UserMailer < ApplicationMailer
    default from: "hotel@gmail.com"

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject:"welcome to the Apllication")
    end
end
