class ResetPasswordMailer < ApplicationMailer 
    def reset_password_email 
        @user = params[:user]
        mail to: @user.email, subject: 'Password reset | RubyAsker'
    end
end