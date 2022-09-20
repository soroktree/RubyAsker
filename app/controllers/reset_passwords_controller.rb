class ResetPasswordsController < ApplicationController 
    before_action :require_no_authentication
    before_action :set_user, only: %i[edit update]


    def create 
        @user = User.find_by(email: params[:email])
        if @user.present? 
            @user.set_reset_password_token
            ResetPasswordMailer.with(user: @user).reset_password_email.deliver_later
        end
         flash[:success] = 'Password reset instructions successfully sent to your email adress'
         redirect_to new_session_path
    end

    def edit;end

    def update
        if @user.update user_params
          flash[:success] = 'Password succefully changed'
          redirect_to new_session_path
        else
          render :edit
        end
      end

    private 
    def set_user 
        @user = User.find_by(email: params[:user][:email],
                            reset_password_token: params[:user][:reset_password_token])
        redirect_to(new_session_path, flash: { warning: "Reset password failed"}) unless @user&.
                             reset_password_period_valid?
    end

    def user_params 
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end